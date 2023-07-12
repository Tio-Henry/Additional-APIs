@tool
extends Node
var file_cfg: String = "res://addons/Additional-APIs/sys_data.dat"
var sys_data = {
	"gj" : {"game_id" : "", "private_key" : ""}
}

func data_save(data: Dictionary, data_file: String):
	var file = FileAccess.open(data_file,FileAccess.WRITE)
	file.store_var(data)
	
func data_load(data: Dictionary, data_file: String):
	var file = FileAccess.open(data_file,FileAccess.READ)
	data.merge(file.get_var(),true)
