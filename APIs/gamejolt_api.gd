extends Node

var web = "https://api.gamejolt.com/api/game/v1_2/"
var _http_request = HTTPRequest.new()
const FUNCTIONS = {
	Data_store = ["data-store"]
} 

func connect_api(TYPE: String):
	var LINK_BASE = web + TYPE
	var LINK_INFO = LINK_BASE + "?game_id=" + _SaveCFG.gamejolt_info["game_id"]
	var LINK_WITH_KEY = LINK_INFO + _SaveCFG.gamejolt_info["private_key"]
	var LINK_FINAL = LINK_INFO + "&signature=" + LINK_WITH_KEY.sha1_text()
	print(LINK_FINAL)
