extends CharacterBody2D

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

var direction: int = 1

var speed: float = 70

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	
	if is_on_wall():
		direction = -direction
	
	velocity.x = direction * speed

	move_and_slide()
