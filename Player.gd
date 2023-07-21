extends CharacterBody2D

@export var world: Node2D
const SPEED = 300.0
const JUMP_VELOCITY = -400.0
var bullet = preload("res://bullet.tscn")
# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta):
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
		
	if Input.is_action_just_pressed("shoot"):
		var bullet_inst = bullet.instantiate()
		owner.add_child(bullet_inst)
		bullet_inst.global_position = global_position
		bullet_inst.look_at(get_global_mouse_position())
	move_and_slide()
