extends CharacterBody2D

@onready var rayR = $RAY_R
@onready var rayL = $RAY_L
@onready var spr = get_node("AnimatedSprite2D")

var groundRay
const SPEED = 10.0
var direction = 1
const JUMP_VELOCITY = -300.0
var vel = 0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _ready():
	velocity.x = 100
	

func _process(delta):
	if velocity.x != 0:
		spr.play("walk")



func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	if velocity.x > 0:
		rayL.enabled = false
		rayR.enabled = true
		groundRay = rayR.is_colliding()
	else:
		rayL.enabled = true
		rayR.enabled = false
		groundRay = rayL.is_colliding()
	
	if velocity.x != 0:
		direction = sign(velocity.x)
	
	if get_wall_normal() == Vector2(-1,0):
		direction = -1
	if get_wall_normal() == Vector2(1,0):
		direction = 1
	
	if is_on_floor():
		velocity.x += SPEED * direction
		velocity.x *= .9
	
	if is_on_floor() and not groundRay:
		velocity.y += JUMP_VELOCITY
	
	# sprite flippong
	if velocity.x > 0:
		spr.flip_h = true
	else:
		spr.flip_h = false


	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	

	move_and_slide()


	
