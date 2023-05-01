@tool
extends Node

var _config = ConfigFile.new()
var _file_cfg: String = "res://_info.cfg"
var gamejolt_info = {
	"game_id" : "",
	"private_key" : ""
}

func _save_info(_info,_userdata):
	var file = FileAccess.open(_userdata,FileAccess.WRITE)
	file.store_var(_info)

func _save_cfg():
	_config.set_value("Game Jolt API","game_id",gamejolt_info["game_id"])
	_config.set_value("Game Jolt API","private_key",gamejolt_info["private_key"])
	_config.save(_file_cfg)
	
func _load_cfg():
	_config.load(_file_cfg)
	gamejolt_info["game_id"] = _config.get_value("Game Jolt API","game_id")
	gamejolt_info["private_key"] = _config.get_value("Game Jolt API","private_key")


