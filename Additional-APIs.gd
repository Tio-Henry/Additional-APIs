@tool
extends EditorPlugin


func _enter_tree():
	# Initialization of the plugin goes here.
	add_autoload_singleton("GameJoltAPI", "res://addons/Additional-APIs/APIs/gamejolt_api.gd")
	pass


func _exit_tree():
	# Clean-up of the plugin goes here.
	remove_autoload_singleton("GameJoltAPI")
	pass
