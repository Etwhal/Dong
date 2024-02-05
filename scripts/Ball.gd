extends CharacterBody2D

var vel : Vector2
@export var speedBall : float = 100
var rng : RandomNumberGenerator

var originalSpeedBall : float

@export_range(-.35, -.30)var minAngle : float
@export_range(-.55, -.50)var maxAngle : float

signal scored(who : StringName)

var BallHitSound : AudioStream = preload("res://audio/sfx/minerjr__ballhit.wav")
var Stream : AudioStreamPlayer

# Called when the node enters the scene tree for the first time.
func _ready():
	rng = RandomNumberGenerator.new()
	originalSpeedBall = speedBall
	
	Stream = get_node("../Camera2D/AudioStreamPlayer")
	Stream.stream = BallHitSound
	
	Stream.volume_db = G_VAR._get_volume()
	
	vel = reset_ball_center()

func _process(delta) -> void:
	var collide = move_and_collide(vel * delta * speedBall)
	if collide:
		on_body_hit(collide)

func on_body_hit(collide : KinematicCollision2D) -> void:
	vel = vel.bounce(collide.get_normal())
	speedBall *= 1.08
	Stream.pitch_scale *= 1.04
	Stream.play()
	
func reset_ball_center() -> Vector2:
	speedBall = originalSpeedBall
	Stream.pitch_scale = 1.0
	return Vector2(rng.randf_range(minAngle, maxAngle), rng.randf_range(minAngle, maxAngle))

func _on_scored_enemy_body_entered(_body):
	position = Vector2.ZERO
	vel = reset_ball_center()
	scored.emit("Enemy")


func _on_scored_player_body_entered(_body):
	position = Vector2.ZERO
	vel = abs(reset_ball_center())
	scored.emit("Player")
