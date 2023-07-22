extends Area2D

var bullet_num:int
@onready var sprite = $Sprite2D
func _physics_process(delta):
	var dir = Vector2.RIGHT.rotated(rotation)
	global_position += 500 * dir * delta


func _on_area_entered(area):
	if area.is_in_group("enemy"):
		area.destroy_enemy(bullet_num)
		queue_free()
	queue_free()


func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()



