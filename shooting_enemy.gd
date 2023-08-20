extends Node2D
var tower_position
var in_range: bool = true
var can_spawn: bool = true
@onready var timer = $Timer
@onready var enemy_bullet = preload("res://enemy_bullet.tscn")
@onready var pos_1 = $bullet_pos
@onready var pos_2 = $bullet_pos2
@onready var pos_3 = $bullet_pos3
@onready var pos_4 = $bullet_pos4

func _ready():
	Global.connect("tower_pos", tower_pos)


func tower_pos(pos):
	tower_position = pos


func _process(delta):
	if in_range == true:
		position = position.move_toward(tower_position, round((50 * Global.difficulty_multiplier) * delta))
		
	if can_spawn == true:
		var inst_bullet_1 = enemy_bullet.instantiate()
		get_parent().add_child(inst_bullet_1)
		inst_bullet_1.global_position = pos_1.global_position
		inst_bullet_1.global_rotation = pos_1.global_rotation
		var inst_bullet_2 = enemy_bullet.instantiate()
		get_parent().add_child(inst_bullet_2)
		inst_bullet_2.global_position = pos_2.global_position
		inst_bullet_2.global_rotation = pos_2.global_rotation
		var inst_bullet_3 = enemy_bullet.instantiate()
		get_parent().add_child(inst_bullet_3)
		inst_bullet_3.global_position = pos_3.global_position
		inst_bullet_3.global_rotation = pos_3.global_rotation
		var inst_bullet_4 = enemy_bullet.instantiate()
		get_parent().add_child(inst_bullet_4)
		inst_bullet_4.global_position = pos_4.global_position
		inst_bullet_4.global_rotation = pos_4.global_rotation
		can_spawn = false
		timer.start(2 / Global.difficulty_multiplier)

func _on_timer_timeout():
	can_spawn = true
