extends Area2D

@export var enemy:Node2D
@export var enem_ai:Node2D

func destroy_enemy(bullet_num):
	if bullet_num == enem_ai.enemy_num:
		Global.amount_enemys_left -= 1
		if enem_ai.quiz_type == "Multiplication":
			Global.add_to_score(50)
		elif enem_ai.quiz_type == "Substraction":
			Global.add_to_score(30)
		elif enem_ai.quiz_type == "Addition":
			Global.add_to_score(10)
		enemy.queue_free()
