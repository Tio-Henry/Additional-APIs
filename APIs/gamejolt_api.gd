extends Node

var web = "https://api.gamejolt.com/api/game/v1_2/"
var _http_request = HTTPRequest.new()
var private_key = "b029daca5e31001ba305c5db528019da"
var _sha1_key = private_key.sha1_text()

func _ready():
	add_child(_http_request)
	print(_sha1_key)
	
func add_score(game_id: String, user_token: String, username: String, private_key, score: String):
#	_http_request.request(web + "score/add/" + "?game_id=" + game_id + "&username=" + username + "&user_token=" + user_token + "&score=" + score + "&signature=" + )
	pass
