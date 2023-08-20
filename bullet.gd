extends Area2D

# set variable at the start of the program
@onready var sprite = $Sprite2D

# variable
var bullet_num:int

# process that happens at a fixed instance
func _physics_process(delta):
	# gets the rotation of the object then finds the  way it facing
	var dir = Vector2.RIGHT.rotated(rotation)
	# changes the position to go towards that direction
	global_position += 1000 * dir * delta

# checks if anything touchs the this object if it is an enemy it would call an function the enemy.
#else it will destroy it self.
func _on_area_entered(area):
	if area.is_in_group("enemy"):
		Global.metadata["Correct"] += 1.0
		area.destroy_enemy(bullet_num)
		queue_free()
	else:
		Global.metadata["Missed"] += 1.0
		queue_free()


func _on_visible_on_screen_notifier_2d_screen_exited():
	Global.metadata["Missed"] += 1.0
	queue_free()



