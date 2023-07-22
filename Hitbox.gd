extends Area2D

@export var enemy:Node2D
@export var enem_ai:Node2D

func destroy_enemy(bullet_num):
	if bullet_num == enem_ai.enemy_num:
		enemy.queue_free()
		Global.amount_enemys_left -= 1
	
