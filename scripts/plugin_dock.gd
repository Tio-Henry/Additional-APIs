@tool
extends Control

func _ready():
	if FileAccess.file_exists(_SaveCFG._file_cfg):
		_SaveCFG._load_cfg()
		$gamejolt_ui/PanelContainer/game_id/LineEdit.text = _SaveCFG.gamejolt_info["game_id"]
		$gamejolt_ui/PanelContainer/private_key/LineEdit.text = _SaveCFG.gamejolt_info["private_key"]

func _on_save_btn_pressed():
	_SaveCFG.gamejolt_info["game_id"] = $gamejolt_ui/PanelContainer/game_id/LineEdit.text
	_SaveCFG.gamejolt_info["private_key"] = $gamejolt_ui/PanelContainer/private_key/LineEdit.text
	_SaveCFG._save_cfg()


func _on_game_jolt_btn_toggled(button_pressed):
	$gamejolt_ui.visible = button_pressed

