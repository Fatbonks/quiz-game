extends Node2D



func _physics_process(delta):
	# gets the rotation of the object then finds the  way it facing
	var dir = Vector2.RIGHT.rotated(rotation)
	# changes the position to go towards that direction
	global_position += 200 * dir * delta
	

# checks if anything touchs the this object if it is an player if it is, it will restart the game.
#else it will destroy it self.
func _on_area_2d_body_entered(body):
	if body.is_in_group("Player"):
		get_tree().change_scene_to_file("res://menu.tscn")
	else:
		queue_free()

# if bullet leaves screen it disapear 
func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()
