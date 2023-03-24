extends Node

var file_cfg = ConfigFile.new()
var gamejolt_file: String = "res://addons/.data_dev/Additional-APIs/gamejolt_info.cfg"
var gamejolt_info = {
	"game_id" : "",
	"private_key" : ""
}
func _save_cfg():
	file_cfg.set_value("Game Jolt API","game_id", gamejolt_info["game_id"])

	pass
	
func _load_cfg(value, file):
	var _file = FileAccess.open(file,FileAccess.READ)
	value = _file.get_as_text()

func _login_GJ(username: String, user_token: String):
	pass
