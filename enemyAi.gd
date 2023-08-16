extends Node2D

@export var text: Label
var lis = []
var enemy_num: int
func _ready():
	#randomize()
	#var random_num = randi_range(1, 3)
	#if random_num == 1:
	#	enemy_num = Global.number_ans
	#elif random_num == 2:
	#	enemy_num = Global.number_ans_2
	#elif random_num == 3:
	#	enemy_num = Global.number_ans_3
	#for e in range(enemy_num+1):
	#	var j = str(e, " + ", enemy_num-e)
	#	lis.insert(0, j)
	#text.text = lis.pick_random()
	#print(lis)
	#for number_x in range(enemy_num+1):
	#	for number_y in range(enemy_num+1):
	#		var mult_num = number_y * number_x
	#		if mult_num == enemy_num:
	#			var temp_num = str(number_x, " * ", number_y)
	#			lis.insert(0, temp_num)
	#text.text = lis.pick_random()
	for i in range(250):
		var test = 250 % (i+1)
		if test == 0:
			var test_num = 250 / (i+1)
			print(test_num,  "*", (i+1), "= 250")
