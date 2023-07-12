@tool
extends EditorPlugin
var plugin_dock = preload("res://addons/Additional-APIs/plugin_dock.tscn").instantiate()

func _enter_tree():
	add_autoload_singleton("SaveCFG", "res://addons/Additional-APIs/scripts/savecfg.gd")
	add_autoload_singleton("GameJoltAPI", "res://addons/Additional-APIs/APIs/gamejolt_api.gd")
	add_control_to_container(EditorPlugin.CONTAINER_PROJECT_SETTING_TAB_LEFT, plugin_dock)
	
func _exit_tree():
	remove_control_from_container(EditorPlugin.CONTAINER_PROJECT_SETTING_TAB_LEFT, plugin_dock)
	remove_autoload_singleton("SaveCFG")
	remove_autoload_singleton("GameJoltAPI")
