extends Node2D

@export var text: Label
var lis = []
var enemy_num: int
func _ready():
	randomize()
	enemy_num = 54
	for e in range(enemy_num+1):
		var j = str(e, " + ", enemy_num-e)
		lis.insert(0, j)
	text.text = lis.pick_random()
	print(lis)



