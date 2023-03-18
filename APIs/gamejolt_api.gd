extends Node

var web = "https://api.gamejolt.com/api/game/v1_2/"
var _http_request = HTTPRequest.new()

func _ready():
	add_child(_http_request)
	
func add_score(game_id: String, user_token: String, username: String, privite_key, score: String):
#	_http_request.request(web + "score/add/" + "?game_id=" + game_id + "&username=" + username + "&user_token=" + user_token + "&score=" + score + "&signature=" + )
	pass
