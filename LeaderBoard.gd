extends Control

@export var names: ItemList
@export var score_list: ItemList
@export var correct: ItemList
@export var missed: ItemList
@export var accuracy: ItemList


func _update_leaderboard():
	names.clear()
	score_list.clear()
	correct.clear()
	missed.clear()
	accuracy.clear()
	
	var sw_result: Dictionary = await SilentWolf.Scores.get_scores().sw_get_scores_complete
	var scores = sw_result.scores
	for score in scores:
		names.add_item(score.player_name)
		score_list.add_item(str(score.score))
		correct.add_item(str(score.metadata["Correct"]))
		missed.add_item(str(score.metadata["Missed"]))
		accuracy.add_item(str(score.metadata["Accuracy"]) + "%")
		print("Player name: " + str(score.player_name) + ", score: " + str(score.score) + ", metadata: " + str(score.metadata))


func _on_button_pressed():
	visible = false
