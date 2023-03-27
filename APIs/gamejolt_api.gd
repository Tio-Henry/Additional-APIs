extends Node

var LINK_BASE = "https://api.gamejolt.com/api/game/v1_2/"
var _request = HTTPRequest.new()
var _user_file: String = "user://gj_data_user.dat"
var data_user: Dictionary = {
	"username":"",
	"user_token":""
}

func _ready():
	add_child(_request)
	_SaveCFG._load_cfg()
	if FileAccess.file_exists(_user_file):
		var file = FileAccess.open(_user_file,FileAccess.READ)
		data_user = file.get_var()


func login_GJ(username: String, user_token: String):
	var userdata = "&username=" + username + "&user_token=" + user_token
	data_user["username"] = username
	data_user["user_token"] = user_token
	_SaveCFG._save_info(data_user,_user_file)
	connect_api("users",userdata)
	print(_request.get_http_client_status())



func connect_api(type: String, code:= ""):
	if FileAccess.file_exists(_user_file):
		if _SaveCFG.gamejolt_info["game_id"] == "" or _SaveCFG.gamejolt_info["private_key"] == "":
			printerr("To use the Game Jolt API it is necessary to inform the Game ID and Private Key of your Game Jolt project page in Project Settings > Additional APIs > Game Jolt")
		else:
			var LINK = LINK_BASE + type + "/?game_id=" + _SaveCFG.gamejolt_info["game_id"] + code
			var LINK_WITH_KEY: String = LINK + _SaveCFG.gamejolt_info["private_key"]
			var LINK_COMPLETE = LINK + "&signature=" + LINK_WITH_KEY.sha1_text()
			print(LINK_COMPLETE)
	else:
		printerr("To use the Game Jolt API it is necessary to inform the Game ID and Private Key of your Game Jolt project page in Project Settings > Additional APIs > Game Jolt")
