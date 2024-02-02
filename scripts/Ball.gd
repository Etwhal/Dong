extends CharacterBody2D

var vel : Vector2
@export var speedBall : float = 100
var rng : RandomNumberGenerator

var originalSpeedBall : float

@export_range(-.35, -.30)var minAngle : float
@export_range(-.55, -.50)var maxAngle : float

signal scored(who : StringName)

# Called when the node enters the scene tree for the first time.
func _ready():
	rng = RandomNumberGenerator.new()
	originalSpeedBall = speedBall
	vel = reset_ball_center()
	
	pass # Replace with function body.

func _process(delta) -> void:
	var collide = move_and_collide(vel * delta * speedBall)
	if collide:
		on_body_hit(collide)

func on_body_hit(collide : KinematicCollision2D) -> void:
	vel = vel.bounce(collide.get_normal())
	speedBall *= 1.10
	
func reset_ball_center() -> Vector2:
	speedBall = originalSpeedBall
	return Vector2(rng.randf_range(minAngle, maxAngle), rng.randf_range(minAngle, maxAngle))

func _on_scored_enemy_body_entered(body):
	position = Vector2.ZERO
	vel = reset_ball_center()
	scored.emit("Enemy")


func _on_scored_player_body_entered(body):
	position = Vector2.ZERO
	vel = abs(reset_ball_center())
	scored.emit("Player")
