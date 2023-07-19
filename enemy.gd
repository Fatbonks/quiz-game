extends Node2D

var tower_position: Vector2
var in_range: bool
func _ready():
	Global.connect("tower_pos", tower_pos)

func _process(delta):
	if in_range == false:
		position = position.move_toward(tower_position, 200 * delta)

func tower_pos(pos):
	tower_position = pos


func _on_area_2d_body_entered(body):
	if body.is_in_group("tower"):
		in_range = true
		print("work")


func _on_area_2d_body_exited(body):
	in_range = false
