extends Node2D

@onready var anim = $AnimationPlayer
func _ready():
	anim.play("new_animation")


func _on_button_pressed():
	get_tree().change_scene_to_file("res://world.tscn")
