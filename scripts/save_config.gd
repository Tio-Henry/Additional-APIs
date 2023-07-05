@tool
extends Node

var _config = ConfigFile.new()
var file_cfg: String = "res://addons/.info.cfg"
var gamejolt_info = {
	"game_id" : "",
	"private_key" : ""
}

func data_save(data: Dictionary, data_file: String):
	var file = FileAccess.open(data_file,FileAccess.WRITE)
	file.store_var(data)

func save_cfg():
	_config.set_value("Game Jolt API","game_id",gamejolt_info["game_id"])
	_config.set_value("Game Jolt API","private_key",gamejolt_info["private_key"])
	_config.save(file_cfg)
	
func load_cfg():
	_config.load(file_cfg)
	gamejolt_info["game_id"] = _config.get_value("Game Jolt API","game_id")
	gamejolt_info["private_key"] = _config.get_value("Game Jolt API","private_key")
