extends Node
var data_user: Dictionary = {
	"username":"",
	"user_token":""
}

var _request = HTTPRequest.new()
var _user_file: String = "user://gj_data_user.dat"
var response_data
enum {USER_DATA, GET_DATA}
var action

func _ready():
	add_child(_request)
	_request.request_completed.connect(self._result_https)
	_SaveCFG._load_cfg()
	if FileAccess.file_exists(_user_file):
		var file = FileAccess.open(_user_file,FileAccess.READ)
		data_user = file.get_var()

func _result_https(result, response_code, headers, body) -> void:
	var json_data = JSON.parse_string(body.get_string_from_utf8())
	var response: Dictionary = json_data["response"]
	if response["success"] != false:
		match action:
			USER_DATA:
				response_data = response.users[0]
			GET_DATA:
				response_data = response.data
	else:
		printerr(response.message)
	print(response_data)
	

func get_key_value(key):
	action = GET_DATA
	var code = "&key=" + key
	connect_api("data-store", code)

func login_GJ(username: String, user_token: String):
	var userdata = "&username=" + username + "&user_token=" + user_token
	data_user["username"] = username
	data_user["user_token"] = user_token
	connect_api("users",userdata)
	_SaveCFG._save_info(data_user,_user_file)
	
func connect_api(type: String, code:= ""):
	if FileAccess.file_exists(_user_file):
		if _SaveCFG.gamejolt_info["game_id"] == "" or _SaveCFG.gamejolt_info["private_key"] == "":
			printerr("To use the Game Jolt API it is necessary to inform the Game ID and Private Key of your Game Jolt project page in Project Settings > Additional APIs > Game Jolt")
		else:
			var LINK = "https://api.gamejolt.com/api/game/v1_2/" + type + "/?game_id=" + _SaveCFG.gamejolt_info["game_id"] + code
			var LINK_WITH_KEY: String = LINK + _SaveCFG.gamejolt_info["private_key"]
			var LINK_COMPLETE = LINK + "&signature=" + LINK_WITH_KEY.sha1_text()
			_request.request(LINK_COMPLETE)
			print(LINK_COMPLETE)
	else:
		printerr("To use the Game Jolt API it is necessary to inform the Game ID and Private Key of your Game Jolt project page in Project Settings > Additional APIs > Game Jolt")
