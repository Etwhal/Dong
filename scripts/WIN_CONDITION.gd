extends Control

var EndingLabel : Label

func _ready() -> void:
	EndingLabel = get_node("WinLabel")
	
func _on_game_ended(player) -> void:
	visible = true
	var gg : String = "J1" if player == "Player" else "J2"
	EndingLabel.text = gg + EndingLabel.text

func _on_menu_button_pressed():
	SceneManager.SwitchScene("Menu")
