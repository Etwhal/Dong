extends Control

func _on_play_button_pressed():
	SceneManager.SwitchScene("Game")


func _on_quit_button_pressed():
	SceneManager.QuitGame()
