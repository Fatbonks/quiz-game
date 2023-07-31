extends CharacterBody2D

@export var world: Node2D
const SPEED = 300.0
const JUMP_VELOCITY = -400.0
var bullet = preload("res://bullet.tscn")
var quiz_num:int
var current_weap:int
@onready var sound = $AudioStreamPlayer
@onready var dagger = $dagger 
@onready var sword = $sword
@onready var axe = $axe
# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _ready():
	dagger.visible = true
	quiz_num = Global.number_ans
	Global.emit_signal("display_current_ans", quiz_num)
	current_weap = 1

func _physics_process(_delta):
	look_at(get_global_mouse_position())
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction_x = Input.get_axis("ui_left", "ui_right")
	var direction_y = Input.get_axis("ui_up", "ui_down")
	if direction_x:
		velocity.x = direction_x * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		
	if direction_y:
		velocity.y = direction_y * SPEED
	else:
		velocity.y = move_toward(velocity.y, 0, SPEED)
	
	move_and_slide()
		
	if Input.is_action_just_pressed("shoot"):
		sound.play()
		var bullet_inst = bullet.instantiate()
		owner.add_child(bullet_inst)
		bullet_inst.global_position = global_position
		bullet_inst.bullet_num = quiz_num
		if current_weap == 1:
			bullet_inst.sprite.frame = 104
		if current_weap == 2:
			bullet_inst.sprite.frame = 106
		if current_weap == 3:
			bullet_inst.sprite.frame = 118
		bullet_inst.look_at(get_global_mouse_position())
	
	if Input.is_action_just_pressed("inv_1"):
		current_weap = 1
		quiz_num = Global.number_ans
		Global.emit_signal("display_current_ans", quiz_num)
		dagger.visible = true
		sword.visible = false
		axe.visible = false
	elif Input.is_action_just_pressed("inv_2"):
		current_weap = 2
		quiz_num = Global.number_ans_2
		Global.emit_signal("display_current_ans", quiz_num)
		dagger.visible = false
		sword.visible = true
		axe.visible = false
	elif Input.is_action_just_pressed("inv_3"):
		current_weap = 3
		quiz_num = Global.number_ans_3
		Global.emit_signal("display_current_ans", quiz_num)
		dagger.visible = false
		sword.visible = false
		axe.visible = true
	elif Input.is_action_just_pressed("change_weapon"):
		if current_weap == 1:
			current_weap = 2
			quiz_num = Global.number_ans_2
			Global.emit_signal("display_current_ans", quiz_num)
			dagger.visible = false
			sword.visible = true
			axe.visible = false 
		elif current_weap == 2:
			current_weap = 3
			quiz_num = Global.number_ans_3
			Global.emit_signal("display_current_ans", quiz_num)
			dagger.visible = false
			sword.visible = false
			axe.visible = true
		elif current_weap == 3:
			current_weap = 1
			quiz_num = Global.number_ans
			Global.emit_signal("display_current_ans", quiz_num)
			dagger.visible = true
			sword.visible = false
			axe.visible = false
	
