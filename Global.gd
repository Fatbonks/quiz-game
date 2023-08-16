extends Node


# dictionary for server
var metadata = {
	"Correct": 20.0,
	"Missed": 80.0,
	"Accuracy": 0.0,
	"Combo": 0,
	"Completed_Waves": 0 
	}
	
# variables for enemies to use
var number_ans = 500
var number_ans_2 = 200
var number_ans_3 = 100
var amount_enemys_left = 0

# Player name and score
var player_name = "bob"
var score: int
var multiplier: float = 1.25
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
	calculate_accuracy()

func calculate_accuracy():
	# calculates accuracy
	metadata["Accuracy"] = snappedf(100.0 - (((metadata.values()[0] + metadata.values()[1]) - metadata.values()[0]) / (metadata.values()[0] + metadata.values()[1]) * 100.0), 0.01)
	print(metadata.values()[2])
	
	# calculates score using multipliers
	
	print(round(metadata["Correct"] * multiplier))

func add_to_score(hit_point):
	score = hit_point * multiplier
	pass

