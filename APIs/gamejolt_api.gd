extends Node
var data_user: Dictionary = {
	"username":"",
	"user_token":""
}

var _request = HTTPRequest.new()
var _user_file: String = "user://gj_data_user.dat"
var response_data
enum {USER_DATA, GET_DATA, ADD_TROPHY}
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
	if response["success"] != "false":
		match action:
			USER_DATA:
				response_data = response.users[0]
			GET_DATA:
				response_data = response.data
			ADD_TROPHY:
				response_data = response
	else:
		printerr(response.message)
	print(response_data)
	

func add_trophy(trophy_id):
	action = ADD_TROPHY
	var code = "&trophy_id=" + str(trophy_id)
	connect_api("trophies/add-achieved",true, code)

func get_key_value(key, require_user):
	action = GET_DATA
	var code = "&key=" + key
	connect_api("data-store", require_user, code)

func login_GJ(username: String, user_token: String):
	data_user["username"] = username
	data_user["user_token"] = user_token
	connect_api("users", true)
	_SaveCFG._save_info(data_user,_user_file)
	
func connect_api(type: String, require_user: bool, code:= ""):
	if FileAccess.file_exists(_user_file):
		if _SaveCFG.gamejolt_info["game_id"] == "" or _SaveCFG.gamejolt_info["private_key"] == "":
			printerr("To use the Game Jolt API it is necessary to inform the Game ID and Private Key of your Game Jolt project page in Project Settings > Additional APIs > Game Jolt")
		else:
			var LINK = "https://api.gamejolt.com/api/game/v1_2/" + type + "/?game_id=" + _SaveCFG.gamejolt_info["game_id"]
			if require_user == true:
				LINK += "&username=" + data_user["username"] + "&user_token=" + data_user["user_token"] + code
			else:
				LINK += code
			var LINK_WITH_KEY: String = LINK + _SaveCFG.gamejolt_info["private_key"]
			var LINK_COMPLETE = LINK + "&signature=" + LINK_WITH_KEY.sha1_text()
			_request.request(LINK_COMPLETE)
			print(LINK_COMPLETE)
	else:
		printerr("To use the Game Jolt API it is necessary to inform the Game ID and Private Key of your Game Jolt project page in Project Settings > Additional APIs > Game Jolt")
