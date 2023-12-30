extends CharacterBody2D

@onready var animationtree : AnimationTree = $AnimationTree


@export var attacking = false
var attackStartTime = 0
const comboWindow = 500

const maxspeed = 500.0

var input = Vector2.ZERO

var qatkvar = 1

func _physics_process(delta):
	player_movement(delta)
	
	var direction = Input.get_axis("a", "d")

	if direction == 1:
		$Skeleton2D.scale.x = -1
	elif direction == -1:
		$Skeleton2D.scale.x = 1
		

	check_combo_attack()



func get_input():
	input.x = int(Input.is_action_pressed("d")) - int(Input.is_action_pressed("a"))
	input.y = int(Input.is_action_pressed("s")) - int(Input.is_action_pressed("w"))
	return input.normalized()


func player_movement(delta):
	input = get_input()
	if input == Vector2.ZERO:
		velocity = Vector2.ZERO
	else:
		velocity = input * maxspeed
		
	if attacking == true:
		velocity = Vector2.ZERO
	else:
		velocity = input * maxspeed

	move_and_slide()



func _ready():

	$".".position = Vector2(960,540)
	
	animationtree.active = true
	

func check_combo_attack():
	if attacking and Input.is_action_just_pressed("rightmouse"):
		if qatkvar == 1:
			animationtree["parameters/conditions/qatk"] = true
		elif qatkvar == 2:
			animationtree["parameters/conditions/qatk2"] = true
			qatkvar = 1  # Reset qatkvar to 1 after triggering qatk2
		var currentTime = Time.get_ticks_msec() / 1000.0
		var elapsedTime = currentTime - attackStartTime
		if elapsedTime >= 500:
			reset_combo_state()



func reset_combo_state():
	attacking = false
	animationtree["parameters/conditions/qatk"] = false
	animationtree["parameters/conditions/qatk2"] = false
	

func start_attack():
	attacking = true
	attackStartTime = Time.get_ticks_msec() / 1000.0

func _process(delta):
	update_animation_parameters()

	if Input.is_action_just_pressed("rightmouse") and not attacking:
		start_attack()
		

	if not Input.is_action_pressed("rightmouse"):
		qatkvar = 1

	

func update_animation_parameters():
	if velocity == Vector2.ZERO:
		animationtree["parameters/conditions/idle"] = true
		animationtree["parameters/conditions/move"] = false
	else:
		get_node("Skeleton2D/legsbone/legs").play("walk")
		animationtree["parameters/conditions/idle"] = false
		animationtree["parameters/conditions/move"] = true

	if(Input.is_action_just_pressed("rightmouse")):

		animationtree["parameters/conditions/move"] = false
		qatkvar += 1

	else:
		animationtree["parameters/conditions/qatk"] = false
		



