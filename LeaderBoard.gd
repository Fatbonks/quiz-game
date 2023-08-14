extends Control

@onready var names = $GridContainer2/ItemList

func _ready():
	_update_leaderboard()

func _update_leaderboard():
	var sw_result = await SilentWolf.Scores.get_scores().sw_get_scores_complete
	var scores = sw_result.scores
	for score in scores:
		names.add_item(score.player_name)
		print("Player name: " + str(score.player_name) + ", score: " + str(score.score) + ", metadata: " + str(score.metadata))
