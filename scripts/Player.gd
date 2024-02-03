extends CharacterBody2D

@export var speedCharac = 140
@export var Ball : CharacterBody2D

var gameContinue : bool = true

func _physics_process(delta) -> void:
	if gameContinue:
		move_and_collide(Vector2(0, GetInput() * speedCharac * delta))
	
func GetInput() -> float:
	match name:
		"Player":
			if Input.is_action_pressed("ui_up"):
				return -1
			if Input.is_action_pressed("ui_down"):
				return 1
		"Enemy":
			if Input.is_action_pressed("P2_up"):
				return -1
			if Input.is_action_pressed("P2_down"):
				return 1
	return 0


func _on_ui_related_nodes_game_ended(_player):
	gameContinue = false
	Ball.queue_free()
