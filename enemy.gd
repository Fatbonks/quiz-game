extends Node2D

var player_position: Vector2

func _physics_process(delta):
	global_position.move_toward(player_position, 0.3)
	
