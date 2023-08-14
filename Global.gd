extends Node


var score = 0
var metadata = {
	"coins": 5,
	"scores": 6
	}
var player_name = "bob"
var number_ans = 500
var number_ans_2 = 200
var number_ans_3 = 100
var amount_enemys_left = 0
signal tower_pos(pos)
signal display_current_ans(ans)


func _ready():

	SilentWolf.configure({
		"api_key": "0TCyTzg2Bi6NTDBg7Oxx99Ejb1jbAETj4Cwj9t9A",
		"game_id": "Quizgame",
		"log_level": 0
		 })

	SilentWolf.configure_scores({
		"open_scene_on_close": "res://scenes/MainPage.tscn"
	})

	SilentWolf.Scores.save_score("bob", 2, "main", metadata)
	SilentWolf.Scores.save_score("rod", 3, "main", metadata)
	SilentWolf.Scores.save_score("tod", 4, "main", metadata)


func get_score(score, coins):

	return score * 1000 + coins
