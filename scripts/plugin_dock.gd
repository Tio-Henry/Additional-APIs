extends Control


func _on_game_jolt_btn_pressed():
	var gamejolt_scene = preload("res://addons/Additional-APIs/UIs/gamejolt_ui.tscn").instantiate()
	get_parent().add_child(gamejolt_scene)
