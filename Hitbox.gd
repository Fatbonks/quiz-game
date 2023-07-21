extends Area2D

@export var enemy:Node2D

func destroy_enemy():
	enemy.queue_free()
