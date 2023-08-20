extends Node2D
@onready var spawn_point = $Path2D/PathFollow2D
@onready var timer = $enemy_spawn_timer
@export var enemy_list = {}
@export var currwave:int 
@export var enemy_to_spawn = []
var wave_value:int
var can_spawn:bool = true
var enemy_spawn_type = []
var amount_of_enemies:int
var can_generate:bool = false

func _ready():
	Global.connect("start_wave", generate_wave)

func _process(delta):
	if can_spawn:
		if len(enemy_to_spawn) > 0:
			randomize()
			var inst_enemy = enemy_to_spawn[0].instantiate()
			spawn_point.progress_ratio = randf_range(0, 1)
			add_child(inst_enemy)
			inst_enemy.global_position = spawn_point.global_position
			enemy_to_spawn.remove_at(0)
			can_spawn = false
			timer.start(1)
	

func generate_wave():
	currwave += 1
	Global.current_wave = currwave
	Global.difficulty_multiplier += 0.5
	wave_value = currwave * 5
	generate_enemies()

func generate_enemies():
	randomize()
	var generated_enemies = []
	while wave_value > 0:
		var rand_enemy = randi_range(0, len(enemy_list) - 1)
		var rand_enemy_cost = enemy_list.values()[rand_enemy].values()[0]
		if wave_value - rand_enemy_cost >= 0:
			generated_enemies.append(enemy_list.keys()[rand_enemy])
			wave_value -= rand_enemy_cost
		elif wave_value <= 0:
			break
	enemy_to_spawn.clear()
	enemy_to_spawn = generated_enemies
	Global.amount_enemys_left = len(enemy_to_spawn)
func _on_enemy_spawn_timer_timeout():
	can_spawn = true
