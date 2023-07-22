extends Node2D


@export var spawn_point: PathFollow2D
@export var enemy_timer: Timer
@export var text: Label
const enemy1_points: int = 1
var enemy = preload("res://enemy.tscn")
var can_spawn: bool = true
var given_points:int = 5
@export var current_amount:int

func _ready():
	Global.amount_enemys_left = current_amount
	text.text = "enemies left: " + str(Global.amount_enemys_left)

func _process(_delta):
	text.text = "enemies left: " + str(Global.amount_enemys_left)
	if current_amount > 0 and can_spawn == true:
		spawn_point.progress_ratio = randf_range(0, 1)
		var enemyinstance = enemy.instantiate()
		add_child(enemyinstance)
		enemyinstance.position = spawn_point.global_position
		can_spawn = false
		current_amount -= 1
		enemy_timer.start(randi_range(1, 2))


func _on_enemy_spawn_timer_timeout():
	can_spawn = true


func _on_button_pressed():
	current_amount = given_points
	Global.amount_enemys_left = current_amount
	text.text = "enemies left: " + str(Global.amount_enemys_left)


func _on_option_button_item_selected(index):
	if index == 2:
		given_points = 5
	if index == 1:
		given_points = 10
	if index == 0:
		given_points = 30
