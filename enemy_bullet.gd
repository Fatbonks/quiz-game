extends Node2D

func _physics_process(delta):
	var dir = Vector2.RIGHT.rotated(rotation)
	global_position += 200 * dir * delta
	


func _on_area_2d_body_entered(body):
	if body.is_in_group("Player"):
		get_tree().change_scene_to_file("res://menu.tscn")
	else:
		queue_free()


func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()
