extends Node


# dictionary for server
var metadata = {
	"Correct": 0.0,
	"Missed": 0.0,
	"Accuracy": 0.0,
	}
	

var current_wave:int

# variables for enemies to use
var number_ans = 10
var number_ans_2 = 50
var number_ans_3 = 100
var amount_enemys_left = 0

# Player name and score
var score: int
var multiplier: float = 1.25
var difficulty_multiplier: float = 1.00
# Signals
signal tower_pos(pos)
signal display_current_ans(ans)
signal start_wave()

func _ready():

	SilentWolf.configure({
		"api_key": "0TCyTzg2Bi6NTDBg7Oxx99Ejb1jbAETj4Cwj9t9A",
		"game_id": "Quizgame",
		"log_level": 1
		 })
		
	SilentWolf.configure_scores({
		"open_scene_on_close": "res://scenes/MainPage.tscn"
		})

func calculate_accuracy():
	# calculates accuracy
	metadata["Accuracy"] = snappedf(100.0 - (((metadata.values()[0] + metadata.values()[1]) - metadata.values()[0]) / (metadata.values()[0] + metadata.values()[1]) * 100.0), 0.01)


func submit_score(player_name):
	calculate_accuracy()
	SilentWolf.Scores.save_score(player_name, score, "main", metadata)

func add_to_score(hit_point):
	# calculates score using multipliers
	score += (hit_point * multiplier * difficulty_multiplier) / 25

func reset_stats():
	metadata["Correct"] = 0.0
	metadata["Missed"]  = 0.0
	metadata["Accuracy"] = 0.0
	score = 0
