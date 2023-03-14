@tool
extends EditorPlugin

var plugin_dock = preload("res://addons/Additional-APIs/plugin_dock.tscn").instantiate()

func _enter_tree():
	# Initialization of the plugin goes here.
	add_autoload_singleton("GameJoltAPI", "res://addons/Additional-APIs/APIs/gamejolt_api.gd")
	get_editor_interface().get_editor_main_screen().add_child(plugin_dock)
	plugin_dock.hide()
	pass

func _has_main_screen():
	return true
	
func _make_visible(visible):
	plugin_dock.visible = visible

func _exit_tree():
	# Clean-up of the plugin goes here.
	remove_control_from_container(EditorPlugin.CONTAINER_CANVAS_EDITOR_BOTTOM, plugin_dock)
	remove_autoload_singleton("GameJoltAPI")
	pass
