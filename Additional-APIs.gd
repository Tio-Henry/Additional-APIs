@tool
extends EditorPlugin

var plugin_dock = preload("res://addons/Additional-APIs/plugin_dock.tscn").instantiate()
var gj_gid_info = {
	"name":"Additional-APIs/Game_Jolt/game_id",
	"type": TYPE_STRING
}
var gj_pi_info = {
	"name":"Additional-APIs/Game_Jolt/game_id",
	"type": TYPE_STRING
}

func _enter_tree():
	# Initialization of the plugin goes here.
	add_autoload_singleton("GameJoltAPI", "res://addons/Additional-APIs/APIs/gamejolt_api.gd")
	ProjectSettings.add_property_info(gj_gid_info)
	ProjectSettings.add_property_info(gj_pi_info)
	pass

func _has_main_screen():
	return true
	
func _make_visible(visible):
	plugin_dock.visible = visible

func _exit_tree():
	# Clean-up of the plugin goes here.
	remove_autoload_singleton("GameJoltAPI")
	pass
