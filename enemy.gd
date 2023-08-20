extends Node2D
@export var sprite: Node2D
var tower_position: Vector2
var in_range: bool
func _ready():
	Global.connect("tower_pos", tower_pos)

func _process(delta):
	if in_range == false:
		position = position.move_toward(tower_position, round((100 * Global.difficulty_multiplier) * delta))
		sprite.look_at(tower_position)

func tower_pos(pos):
	tower_position = pos


