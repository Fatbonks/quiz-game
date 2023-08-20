extends Node2D
# lets me assign an object to variable in the inspector
@export var submit_score: Control
@export var leaderboard: Control
@export var player_name_box: Control
@export var display_score: Label
@export var display_accuracy: Label
@export var display_correct: Label
@export var display_missed: Label

# finds the animation player in scene
@onready var anim = $AnimationPlayer

# sets the text to the stats if there is any
func _ready():
	Global.calculate_accuracy()
	anim.play("new_animation")
	display_score.text = "Score: " + str(Global.score)
	display_accuracy.text = "Accuracy: " + str(Global.metadata["Accuracy"]) + "%"
	display_correct.text = "Correct: " + str(Global.metadata["Correct"])
	display_missed.text = "Missed: " + str(Global.metadata["Missed"])

# when you click play resets stats and change the scene to the game
func _on_button_pressed():
	Global.reset_stats()
	get_tree().change_scene_to_file("res://world.tscn")
	

# when you press the leaderboard button update leaderboard
func _on_leaderboard_pressed():
	leaderboard._update_leaderboard()
	leaderboard.visible = true
	

# makes the ui visible
func _on_submit_score_pressed():
	submit_score.visible = true

# makes the ui invisible
func _on_close_pressed():
	submit_score.visible = false

# when you press the submit button submit score
func _on_submit_pressed():
	Global.submit_score(str(player_name_box.text))
