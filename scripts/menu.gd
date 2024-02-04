extends Control

func _on_play_button_pressed():
	SceneManager.SwitchScene("Game")

func _on_quit_button_pressed():
	SceneManager.QuitGame()


func _on_shader_button_toggled(toggled_on):
	var shader : CanvasItem = get_node("Shader")
	
	shader.visible = toggled_on

