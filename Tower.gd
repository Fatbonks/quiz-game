extends Node2D

var health = 50
var can_spawn: bool = false
var in_range: bool = false
@export var healthbar: TextureProgressBar
@export var text: Label
func  _ready():
	healthbar.max_value = health
	healthbar.value = health

func _process(_delta):
	Global.emit_signal("tower_pos", position)
	if Input.is_action_just_pressed("interact") and in_range == true and can_spawn == true:
		Global.emit_signal("start_wave")
		can_spawn = false
		text.visible = false
	elif Input.is_action_just_pressed("main_menu") and in_range == true and can_spawn == true:
		get_tree().change_scene_to_file("res://menu.tscn")

func _on_area_2d_area_entered(area):
	if area.is_in_group("enemy"):
		area.get_parent().queue_free()
		Global.amount_enemys_left -= 1
		health -= 1
		healthbar.value -= 1
		
	if health <= 0:
		get_tree().change_scene_to_file("res://menu.tscn")


func _on_interact_area_body_entered(body):
	if body.is_in_group("Player") and Global.amount_enemys_left <= 0:
		in_range = true
		text.visible = true
		can_spawn = true




func _on_interact_area_body_exited(body):
	if body.is_in_group("Player"):
		text.visible = false
		in_range = false
