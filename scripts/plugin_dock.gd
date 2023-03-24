extends Control

func _on_save_btn_pressed():
  _SaveCFG.gamejolt_info["game_id"] = $plugin_dock/
	_SaveCFG._save_cfg()
	pass


func _on_game_jolt_btn_toggled(button_pressed):
	$gamejolt_ui.visible = button_pressed
