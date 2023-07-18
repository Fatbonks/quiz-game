extends Node2D

var enemy_num: int
@export var text: Label
var lis = []

func _ready():
	randomize()
	enemy_num = 10
	var cons_num = 1
	for e in range(enemy_num + 1):
		for i in range(enemy_num + 1):
			var num = e + i
			if num == enemy_num:
				cons_num += 1
				var j = str(e, " + ", i)
				lis.insert(0, j)
				
	print(cons_num)
	print(lis)
	
	text.text = lis.pick_random()
