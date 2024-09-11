extends CharacterBody3D

# Speed
@export var move_speed : float = 10.0
@export var vert_speed : float = 10.0

func _ready():
	# Initialize player node
	pass

func _physics_process(_delta):
	# Get input (WASD)
	if Input.is_action_pressed("move_forward"):
		velocity.z -= 1
	if Input.is_action_pressed("move_back"):
		velocity.z += 1
	if Input.is_action_pressed("move_left"):
		velocity.x -= 1
	if Input.is_action_pressed("move_right"):
		velocity.x += 1

	# Get input (Q/E)
	if Input.is_action_pressed("move_up"):
		velocity.y += 1
	if Input.is_action_pressed("move_down"):
		velocity.y -= 1

	# Normalize velocity vector -> Normal speed in diagonal movement
	velocity = velocity.normalized() * move_speed

	# Apply vertical movement speed
	if velocity.y != 0:
		velocity.y = vert_speed if velocity.y > 0 else -vert_speed

	# Apply movement to CharacterBody3D
	move_and_slide()
