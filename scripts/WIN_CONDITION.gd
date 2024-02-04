extends Control

var EndingLabel : Label
var AudioS : AudioStreamPlayer

var VictoryMusic : AudioStream = preload("res://audio/music/sheyvan__music-orchestral-victory-fanfare.wav")
var VictoryMusic2 : AudioStream = preload("res://audio/music/inverted_sheyvan__music-orchestral-victory-fanfare.wav")
func _ready() -> void:
	EndingLabel = get_node("WinLabel")
	AudioS = get_node("../../Camera2D/AudioStreamPlayer")
	
func _on_game_ended(player) -> void:
	visible = true
	var gg : String = "J1" if player == "Player" else "J2"
	EndingLabel.text = gg + EndingLabel.text
	
	AudioS.stream = VictoryMusic if gg == "J1" else VictoryMusic2
	AudioS.play()

func _on_menu_button_pressed():
	SceneManager.SwitchScene("Menu")
