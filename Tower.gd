extends Node2D



func _process(delta):
	Global.emit_signal("tower_pos", position)
