@tool
extends Control

func _ready():
	if FileAccess.file_exists(SaveCFG.file_cfg):
		SaveCFG.data_load(SaveCFG.sys_data,SaveCFG.file_cfg)
		$gamejolt_ui/PanelContainer/game_id/LineEdit.text = SaveCFG.sys_data["gj"]["game_id"]
		$gamejolt_ui/PanelContainer/private_key/LineEdit.text = SaveCFG.sys_data["gj"]["private_key"]

func _on_save_btn_pressed():
	SaveCFG.sys_data["gj"]["game_id"] = $gamejolt_ui/PanelContainer/game_id/LineEdit.text
	SaveCFG.sys_data["gj"]["private_key"] = $gamejolt_ui/PanelContainer/private_key/LineEdit.text
	SaveCFG.data_save(SaveCFG.sys_data,SaveCFG.file_cfg)


func _on_game_jolt_btn_toggled(button_pressed):
	$gamejolt_ui.visible = button_pressed
