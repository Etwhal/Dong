extends Node
class_name NSceneManager

# Collections of scenes
@export var Scenes : Dictionary = {}

# Alias of current scene
var m_CurrentSceneAlias : String = ""

func _ready() -> void:
	var mainScene : StringName = ProjectSettings.get_setting("application/run/main_scene")
	m_CurrentSceneAlias = Scenes.find_key(mainScene)

# Description: Add a scene and its path to the dictionary
# '-> void' mean the function return void
# could also end with a 'pass' and it would be the same
func AddScene(sceneAlias : String, scenePath : String) -> void:
	Scenes[sceneAlias] = scenePath

# Description: Remove a scene from the dictionary	
func RemoveScene(sceneAlias : String) -> void:
	Scenes.erase(sceneAlias)

# Description: Switch to a selected scene
func SwitchScene(sceneAlias : String) -> void:
	SceneTransition.change_scene_to_file(Scenes[sceneAlias])

# Description: Reload the current scene
func ReloadScene() -> void:
	SceneTransition.reload_current_scene()
	
# Description: Quit the game
func QuitGame() -> void:
	get_tree().quit()
	
# Description: Return the numbers of scenes in the dictionary
func GetScenesCount() -> int:
	return Scenes.size()

# Description: Return name of the current scene
func GetCurrentSceneAlias() -> String:
	return m_CurrentSceneAlias
