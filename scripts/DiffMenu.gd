extends Control

enum STATE_DIFF {SHORT = 3, MEDIUM = 5, LONG = 10}

var diff : STATE_DIFF = STATE_DIFF.SHORT
@export var shaderCRT : ColorRect

func _ready():
	shaderCRT.visible = G_VAR._get_shader()

func EASY() -> void:
	diff = STATE_DIFF.SHORT
	
func MEDIUM() -> void:
	diff = STATE_DIFF.MEDIUM
	
func HARD() -> void:
	diff = STATE_DIFF.LONG
	
# ---------------- ON HOVER ----------------
func _on_short_game_mouse_entered():
	EASY()

func _on_medium_game_mouse_entered():
	MEDIUM()

func _on_long_game_mouse_entered():
	HARD()
	
# ---------------- ON PRESS ----------------
func _on_game_pressed():
	G_VAR._set_lengh(diff)
	SceneManager.SwitchScene("Game")
