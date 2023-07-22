extends Node2D

@export var label: Label

func _ready():
	label.text = "50"
	Global.connect("display_current_ans", update_label)
	
func update_label(text):
	label.text = str(text)





