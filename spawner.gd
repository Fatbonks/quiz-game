extends Node2D

# variables that get seen in the inspector and lets me add to it
@export var spawn_point: PathFollow2D
@export var enemy_timer: Timer
@export var text: Label

# preloads the enemy file to be used in order to instance the enemy into the scene
var enemy = preload("res://enemy.tscn")
# checks if the enemy can spawn after a certain time limit
var can_spawn: bool = true
# for debug purposes lets the player submit the amount of enemys that can spawn
var given_points:int = 5
# current amount of enemys that need to be spawned in
@export var current_amount:int


func _ready():
	Global.amount_enemys_left = current_amount
	text.text = "enemies left: " + str(Global.amount_enemys_left)

func _process(_delta):
	text.text = "enemies left: " + str(Global.amount_enemys_left)
	# checks if there is any enemies to spawn if there is then it will spawn it.
	# then sets the can_spawn to false and calls an timer 
	if current_amount > 0 and can_spawn == true:
		spawn_point.progress_ratio = randf_range(0, 1)
		var enemyinstance = enemy.instantiate()
		add_child(enemyinstance)
		enemyinstance.position = spawn_point.global_position
		can_spawn = false
		current_amount -= 1
		enemy_timer.start(randi_range(1, 2))

# when timer ends it sets can_spawn = true
func _on_enemy_spawn_timer_timeout():
	can_spawn = true

# submits the amount of enemys the player has selected (only for debug purposes)
func _on_button_pressed():
	current_amount = given_points
	Global.amount_enemys_left = current_amount
	text.text = "enemies left: " + str(Global.amount_enemys_left)

#gives an option of 5, 10 or 30 enemies which the player can spawn (omly for debug purposes)
func _on_option_button_item_selected(index):
	if index == 2:
		given_points = 5
	if index == 1:
		given_points = 10
	if index == 0:
		given_points = 30
