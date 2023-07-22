extends Node2D

var health = 50
@export var healthbar: TextureProgressBar

func  _ready():
	healthbar.max_value = health
	healthbar.value = health

func _process(_delta):
	Global.emit_signal("tower_pos", position)


func _on_area_2d_area_entered(area):
	if area.is_in_group("enemy"):
		area.get_parent().queue_free()
		Global.amount_enemys_left -= 1
		health -= 1
		healthbar.value -= 1
		
	if health <= 0:
		queue_free()
