extends Node2D

@export var text: Label
var lis = []
var enemy_num: int
var quiz_type: String
func _ready():
	randomize()
	var sum = 80 + 50 + 20
	var random_num = randi_range(1, 3)
	var random_int = randi_range(0, sum)
	if random_num == 1:
		enemy_num = Global.number_ans
	elif random_num == 2:
		enemy_num = Global.number_ans_2
	elif random_num == 3:
		enemy_num = Global.number_ans_3
	
	if random_int in range(130, 150):
		# multiplication quiz question generation
		for i in range(enemy_num):
			var temp_num = enemy_num % (i+1)
			if temp_num == 0:
				var test_num = enemy_num / (i+1)
				var quiz_question = str(test_num, " x ", (i+1)) 
				lis.insert(0, quiz_question)
			quiz_type = "Multiplication"
	elif random_int in range(80, 130):
		# substraction quiz question generation
		for sub in range(enemy_num+1):
			var temp_num = str(enemy_num+sub, " - ", sub)
			lis.insert(0, temp_num)
		quiz_type = "Substraction"
	elif random_num in range(0, 80):
		# addition quiz question genaration
		for add in range(enemy_num+1):
			var temp_num = str(add, " + ", enemy_num-add)
			lis.insert(0, temp_num)
		quiz_type = "Addition"
	text.text = lis.pick_random()
