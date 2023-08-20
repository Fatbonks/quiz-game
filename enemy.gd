extends Node2D
# lets me assign an object to variable in the inspector
@export var sprite: Node2D

#variables
var tower_position: Vector2
var in_range: bool

# connects an signal which waits for an other object to send the position of the tower
func _ready():
	Global.connect("tower_pos", tower_pos)

# move towards tower 
func _process(delta):
	position = position.move_toward(tower_position, round((100 * Global.difficulty_multiplier) * delta))
	sprite.look_at(tower_position)

# gets the tower position
func tower_pos(pos):
	tower_position = pos


