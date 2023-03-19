extends Control

var _menu: int = 1


func _on_save_btn_pressed():
	
	pass # Replace with function body.


func _on_game_jolt_btn_toggled(button_pressed):
	$gamejolt_ui.visible = button_pressed
	if button_pressed == true:
		self._menu = 1
