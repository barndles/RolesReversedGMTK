extends CharacterBody2D

@onready var groundRay = $Ray_DOWN
@onready var ray_left = $Ray_LEFT
@onready var ray_right = $Ray_RIGHT
const SPEED = 200.0
var direction = 1
const JUMP_VELOCITY = -200.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	if velocity.x < 0:
		ray_right.enabled = false
		ray_left.enabled = true
	elif velocity.x > 0:
		ray_right.enabled = true
		ray_left.enabled = false 
	
	velocity.x = SPEED
	# Handle Jump.
	if groundRay.is_colliding() == false and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	

	move_and_slide()
