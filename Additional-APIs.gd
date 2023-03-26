@tool
extends EditorPlugin
var plugin_dock = preload("res://addons/Additional-APIs/plugin_dock.tscn").instantiate()

func _enter_tree():
	add_control_to_container(EditorPlugin.CONTAINER_PROJECT_SETTING_TAB_LEFT, plugin_dock)
	add_autoload_singleton("GameJoltAPI", "res://addons/Additional-APIs/APIs/gamejolt_api.gd")
	add_autoload_singleton("_SaveCFG", "res://addons/Additional-APIs/scripts/save_config.gd")
	pass
	
func _exit_tree():
	remove_control_from_container(EditorPlugin.CONTAINER_PROJECT_SETTING_TAB_LEFT, plugin_dock)
	remove_autoload_singleton("GameJoltAPI")
	remove_autoload_singleton("_SaveCFG")
	pass
