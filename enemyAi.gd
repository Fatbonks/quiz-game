extends Node2D

@export var text: Label
var lis = []
var enemy_num: int
func _ready():
	var random_num = randi_range(1, 3)
	if random_num == 1:
		enemy_num = Global.number_ans
	elif random_num == 2:
		enemy_num = Global.number_ans_2
	elif random_num == 3:
		enemy_num = Global.number_ans_3
	randomize()
	for e in range(enemy_num+1):
		var j = str(e, " + ", enemy_num-e)
		lis.insert(0, j)
	text.text = lis.pick_random()



