extends Node

#General Variables

var session_id = ''
var game_key = 'dev_5a1a6187daca4ae59310b38022fc8786'
var game_version = '1.0.0.0'
var platform = 'godot'
var score = 3
var player_name = 'adwads'
var leaderboard_id = '16742'
var session_token = ""
var public_uid = ''

#HTTP Request

var guest_login_http = HTTPRequest.new()
var white_label_auth_http = HTTPRequest.new()

var white_label_signup_http = HTTPRequest.new()
var white_label_login_http = HTTPRequest.new()

var leaderboard_http = HTTPRequest.new()
var submit_score_http = HTTPRequest.new()

var get_player_name_http = HTTPRequest.new()
var set_player_name_http = HTTPRequest.new()

#Errors

func _ready():
	add_child(set_player_name_http)
	add_child(get_player_name_http)
	
	add_child(submit_score_http)
	add_child(leaderboard_http)
	
	add_child(white_label_login_http)
	add_child(white_label_signup_http)
	
	add_child(white_label_auth_http)
	add_child(guest_login_http)
	
	
	
	leaderboard_http.request_completed.connect(_get_leaderboard_request_completed)
	submit_score_http.request_completed.connect(_submit_score_request_completed)
	
	get_player_name_http.request_completed.connect(_get_player_name_request_completed)
	set_player_name_http.request_completed.connect(_set_player_name_request_completed)
	
	_upload_score(3)

	
	var headers = ['Content-Type: application/json']
	var data = {'game_key': game_key, 'game_version': game_version}
	
	

func _upload_score(score):
	var data = { "score": str(score) }
	var headers = ["Content-Type: application/json", "x-session-token:"+session_token]
	submit_score_http = HTTPRequest.new()
	add_child(submit_score_http)
	submit_score_http.connect("request_completed", _submit_score_request_completed)
	# Send request
	submit_score_http.request("https://api.lootlocker.io/game/leaderboards/"+leaderboard_id+"/submit", headers, HTTPClient.METHOD_POST, JSON.stringify(data))
	# Print what we're sending, for debugging purposes:
	print(data)

func _get_player_name():
	var headers = ['x-session-token: ' + session_id, 'LL-version: 2021-03-01', 'Content-Type: application/json']
	get_player_name_http.request('https://api.lootlocker.io/game/player/name', headers, HTTPClient.METHOD_GET, '')

func _get_player_name_request_completed(_result, _response_code, _headers, body):
	var json = JSON.parse_string(body.get_string_from_utf8())
	
	if json.has('name'):
		player_name = json.name
		print('Pulled player name from lootlocker')
		print(player_name)
		
	if json.has('error'):
		push_error(json.message)

func _set_player_name():
	var headers = ['x-session-token:' + session_id, 'LL-version: 2021-03-01', 'Content-Type: application/json']
	var data = {'name': player_name}

	set_player_name_http.request('https://api.lootlocker.io/game/player/name', headers, HTTPClient.METHOD_PATCH, JSON.stringify(data))

func _set_player_name_request_completed(_result, _response_code, _headers, body):
	var json = JSON.parse_string(body.get_string_from_utf8())
	
	if json.has('error'):
		push_error(json.message)
	else:
		print('Player name set to ' + json.name)

func _get_leaderboard():
	var headers = ['x-session-token:' + session_id]
	
	leaderboard_http.request('https://api.lootlocker.io/game/leaderboards/'+leaderboard_id+'/list?count=10', headers,HTTPClient.METHOD_GET, '')

func _get_leaderboard_request_completed(_result, _response_code, _headers, body):
	var json = JSON.parse_string(body.get_string_from_utf8())
	if json.has('error'):
		push_error(json.message)
	else:
		print('LeaderBoard pulled form lootlocker:')
		print(json.items)


func _submit_score():
	var headers = ['x-session-token:' + session_id, 'Content-Type: application/json']
	var data = {'score': score}

	submit_score_http.request('https://api.lootlocker.io/game/leaderboards/' +session_id + '/submit', headers, HTTPClient.METHOD_POST, JSON.stringify(data))

func _submit_score_request_completed(_result, _response_code, _headers, body):
	var json = JSON.parse_string(body.get_string_from_utf8())
	
	if json.has('error'):
		push_error(json.message)
	
	# Clear node
	submit_score_http.queue_free()


