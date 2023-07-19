extends Node2D

@export var text: Label
var lis = []
var enemy_num: int
func _ready():
	randomize()
	enemy_num = 54
	var cons_num = 1
	for e in range(100):
		for i in range(100):
			var num = e + i
			if num == enemy_num:
				cons_num += 1
				var j = str(e, " + ", i)
				lis.insert(0, j)
				
	text.text = lis.pick_random()
	Global.connect("player_pos", player_position)


func player_position(pos):
	pass

