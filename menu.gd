extends Node2D
@export var submit_score: Control
@export var leaderboard: Control
@export var player_name_box: Control
@onready var anim = $AnimationPlayer

@export var display_score: Label
@export var display_accuracy: Label
@export var display_correct: Label
@export var display_missed: Label
func _ready():
	Global.calculate_accuracy()
	anim.play("new_animation")
	display_score.text = "Score: " + str(Global.score)
	display_accuracy.text = "Accuracy: " + str(Global.metadata["Accuracy"]) + "%"
	display_correct.text = "Correct: " + str(Global.metadata["Correct"])
	display_missed.text = "Missed: " + str(Global.metadata["Missed"])

func _on_button_pressed():
	get_tree().change_scene_to_file("res://world.tscn")
	Global.reset_stats()


func _on_leaderboard_pressed():
	leaderboard._update_leaderboard()
	leaderboard.visible = true
	


func _on_submit_score_pressed():
	submit_score.visible = true


func _on_close_pressed():
	submit_score.visible = false


func _on_submit_pressed():
	Global.submit_score(str(player_name_box.text))
