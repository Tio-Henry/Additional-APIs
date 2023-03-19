extends Control

var menu: String = "gamejolt"

func _on_save_btn_pressed():
	_SaveCFG._save_cfg(menu + "_info", menu + "_file")
	pass # Replace with function body.


func _on_game_jolt_btn_toggled(button_pressed):
	$gamejolt_ui.visible = button_pressed
