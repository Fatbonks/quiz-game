extends Node


# dictionary for server
var metadata = {
	"Incorrect": 0,
	"Missed": 0,
	"Accuracy": 0,
	"Combo": 0,
	"Completed_Waves": 0 
	}
	
# variables
var number_ans = 500
var number_ans_2 = 200
var number_ans_3 = 100
var amount_enemys_left = 0

var player_name = "bob"
# Player Stats for leaderboard
var score: int
var Missed: float = 200.0
var Correct: float = 10.0
var Accuracy: float
var Combo: int
var Completed_Waves:int
# Signals
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
	calculate_score()

func calculate_score():
	print(100.0 - (((Correct + Missed) - Correct) / (Correct + Missed) * 100.0))
	print("work")


