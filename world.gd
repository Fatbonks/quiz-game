extends Node2D
# lets me assign an object to variable in the inspector
@export var enemy_text: Label
@export var score_text: Label
@export var wave_text: Label

# only used for updating ui in the game
func _process(delta):
	enemy_text.text = "enemies left: " + str(Global.amount_enemys_left)
	score_text.text = "Score: " + str(Global.score)
	wave_text.text = "Current Wave: " + str(Global.current_wave)
