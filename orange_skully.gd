extends CharacterBody2D

@onready var animationtree : AnimationTree = $AnimationTree
@onready var state = animationtree.get("parameters/playback")
@onready var attackQueue = []

@onready var timer : Timer = $Timer
@onready var preatk : Timer = $PreAtkTimer
var comboSequence = [0, 1]
var currentInputIndex = 0
var timeLeft = 0


enum PlayerState {
	IDLE,
	WALKING,
	ATTACKING,
}

enum AttackState{

}

const maxspeed = 500.0
var input = Vector2.ZERO
var qatkvar = 1

var attacking = false

var canpreatk = false

func _physics_process(delta):
	player_movement(delta)
	
	var direction = Input.get_axis("a", "d")

	if direction == 1:
		$Skeleton2D.scale.x = -1
	elif direction == -1:
		$Skeleton2D.scale.x = 1
		

	



func get_input():
	input.x = int(Input.is_action_pressed("d")) - int(Input.is_action_pressed("a"))
	input.y = int(Input.is_action_pressed("s")) - int(Input.is_action_pressed("w"))
	return input.normalized()


func player_movement(delta):
	input = get_input()
	if input == Vector2.ZERO:
		velocity = Vector2.ZERO
	elif input != Vector2.ZERO and not attacking:
		velocity = input * maxspeed
		
	if attacking:
		velocity = Vector2.ZERO
		
		
	move_and_slide()




func _ready():
	timer.wait_time = 0.8
	timer.one_shot = true
	
	preatk.wait_time = 0.3
	preatk.one_shot = true



	$".".position = Vector2(960,540)
	
	animationtree.active = true
	
func _on_timer_timeout():
	currentInputIndex = 0
	

func executeAttack(attackindex):
	match attackindex:
		0:
			state.travel("qatk1")
		1:
			state.travel("qatk2")
		2:
			state.travel("satk")


func _input(event):
	if Input.is_action_just_pressed("rightmouse") and currentInputIndex < comboSequence.size():
		if comboSequence[currentInputIndex] == 0:
			qatkcode()
		elif comboSequence[currentInputIndex] == 1:
			qatkcode()
	elif Input.is_action_just_pressed("leftmouse"):
		satkcode()








func qatkcode():
	if preatk.is_stopped():
		preatk.start()
		startattack(0)
		timer.stop()
		timer.start()
		if comboSequence[currentInputIndex] == 0:
			executeAttack(0)
			currentInputIndex = 1
		elif comboSequence[currentInputIndex] == 1:
			executeAttack(1)
			currentInputIndex = 0

	elif !preatk.is_stopped():
		var timeLeft = preatk.wait_time - preatk.time_left
		await get_tree().create_timer(timeLeft).timeout
		preatk.start()
		startattack(0)
		timer.stop()
		timer.start()
		if comboSequence[currentInputIndex] == 0:
			executeAttack(0)
			currentInputIndex = 1
		elif comboSequence[currentInputIndex] == 1:
			executeAttack(1)
			currentInputIndex = 0

func satkcode():
	if preatk.is_stopped():
		preatk.start()
		startattack(1)
		timer.stop()
		timer.start()
		executeAttack(2)

	elif !preatk.is_stopped():
		var timeLeft = preatk.wait_time - preatk.time_left
		await get_tree().create_timer(timeLeft).timeout
		preatk.start()
		startattack(1)
		timer.stop()
		timer.start()
		state.travel("satk")





func startattack(index):
	match index:
		0:
			attacking = true
			await get_tree().create_timer(0.3).timeout
			attacking = false
		1:
			attacking = true
			await get_tree().create_timer(0.8).timeout
			attacking = false

	
	

func _process(delta):
	update_animation_parameters()

	if not attacking and attackQueue.size() > 0:
		# Dequeue the next attack
		var nextAttack = attackQueue.pop_front()
		# Execute the attack
		executeAttack(nextAttack)



	
	

func update_animation_parameters():
	if velocity == Vector2.ZERO and not attacking:

		state.travel("idle")
	elif velocity != Vector2.ZERO and not attacking:
		get_node("Skeleton2D/legsbone/legs").play("walk")

		state.travel("walk")









