extends Control

var insideTimer : Timer

func _ready():
	insideTimer = $Timer
	$Shader.visible = G_VAR._get_shader()

func _input(event):
	if event.is_action("Pause") && insideTimer.is_stopped():
		SceneManager.SwitchScene("DiffMenu")
		pass

func _on_timer_timeout():
		$Label/Blink.play('Blinking')
