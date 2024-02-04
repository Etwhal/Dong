extends Node

var ShaderActivated : bool = false
var volume_value : float = 0.0

func _set_shader(value : bool) -> void:
	ShaderActivated = value

func _get_shader() -> bool:
	return ShaderActivated

func _set_volume(value : float) -> void:
	volume_value = value
	
func _get_volume() -> float:
	return volume_value
