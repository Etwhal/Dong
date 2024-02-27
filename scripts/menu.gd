extends Control

func _ready() -> void:
	get_node("Shader").visible = G_VAR._get_shader()
	get_node("OptionsButtons/ShaderButton").set_pressed_no_signal(G_VAR._get_shader())
	get_node("OptionsButtons/HSlider").value = G_VAR._get_volume()

func _on_play_button_pressed():
	G_VAR._set_volume(get_node("OptionsButtons/HSlider").value)
	SceneManager.SwitchScene("Instruction")

func _on_quit_button_pressed():
	SceneManager.QuitGame()

func _on_shader_button_toggled(toggled_on):
	var shader : CanvasItem = get_node("Shader")
	
	shader.visible = toggled_on
	G_VAR._set_shader(toggled_on)
