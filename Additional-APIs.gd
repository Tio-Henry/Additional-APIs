@tool
extends EditorPlugin

var GJC_DOCK = preload("res://addons/Additional-APIs/UIs/gamejolt_ui.tscn").instantiate()

func _enter_tree():
	# Initialization of the plugin goes here.
	add_autoload_singleton("GameJoltAPI", "res://addons/Additional-APIs/APIs/gamejolt_api.gd")
	add_control_to_container(EditorPlugin.CONTAINER_CANVAS_EDITOR_BOTTOM, GJC_DOCK)
	pass


func _exit_tree():
	# Clean-up of the plugin goes here.
	remove_control_from_container(EditorPlugin.CONTAINER_CANVAS_EDITOR_BOTTOM, GJC_DOCK)
	remove_autoload_singleton("GameJoltAPI")
	pass
