extends Control

func _on_save_btn_pressed():
	_SaveCFG._save_cfg(_SaveCFG.gamejolt_info)
	pass


func _on_game_jolt_btn_toggled(button_pressed):
	$gamejolt_ui.visible = button_pressed
