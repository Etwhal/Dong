extends CharacterBody2D

@export var speedCharac = 140

func _physics_process(delta) -> void:
	move_and_collide(Vector2(0, GetInput() * speedCharac * delta))
	
func GetInput() -> float:
	if Input.is_action_pressed("ui_up"):
		return -1
	if Input.is_action_pressed("ui_down"):
		return 1
	return 0
