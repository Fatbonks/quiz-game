extends Node2D

@export var enemy_text: Label
@export var score_text: Label
@export var wave_text: Label
func _process(delta):
	enemy_text.text = "enemies left: " + str(Global.amount_enemys_left)
	score_text.text = "Score: " + str(Global.score)
	wave_text.text = "Current Wave: " + str(Global.current_wave)
