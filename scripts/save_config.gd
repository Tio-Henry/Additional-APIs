extends Node

var gamejolt_file: String = "res://addons/.data_dev/Additional-APIs/gamejolt_info.cfg"
var gamejolt_info: Dictionary = {
	"game_id" : "",
	"private_key" : ""
}

func _save_cfg(api, file):
	var _file = FileAccess.open(file, FileAccess.WRITE)
	_file.store_string(api)
	
func _load_cfg(api, file):
	var _file = FileAccess.open(file, FileAccess.READ)
	api = _file.get_as_text()
