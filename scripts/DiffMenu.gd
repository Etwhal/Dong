extends Control

@export var Label_info : Label

enum STATE_DIFF {SHORT = 3, MEDIUM = 5, LONG = 10}

var diff : STATE_DIFF = STATE_DIFF.SHORT
@export var shaderCRT : ColorRect

func _ready():
	shaderCRT.visible = G_VAR._get_shader()

func EASY() -> String:
	diff = STATE_DIFF.SHORT
	return "3 points, short game, max 2 minutes."
	
func MEDIUM() -> String:
	diff = STATE_DIFF.MEDIUM
	return "5 points, takes a little longer, max 5 minutes."
	
func HARD() -> String:
	diff = STATE_DIFF.LONG
	return "10 points, the longest, max 10 minutes."
	
# ---------------- ON HOVER ----------------
func _on_short_game_mouse_entered():
	Label_info.text = EASY()

func _on_medium_game_mouse_entered():
	Label_info.text = MEDIUM()

func _on_long_game_mouse_entered():
	Label_info.text = HARD()
	
# ---------------- ON PRESS ----------------
func _on_game_pressed():
	G_VAR._set_lengh(diff)
	SceneManager.SwitchScene("Game")
