extends CharacterBody2D

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

var direction: int = 1

var speed: float = 70

func _physics_process(delta):
	# Add the gravity.
	
	handle_collisions()
	
	if is_on_wall():
		direction = -direction
	
	if is_on_floor():
		velocity.x = direction * speed
	else:
		velocity.y += gravity * delta
	
	move_and_slide()

func handle_collisions():
	for collision_index in get_slide_collision_count():
		var collision: KinematicCollision2D = get_slide_collision(collision_index)
		var collider = collision.get_collider()
		if !(collider is CollisionObject2D):
			return
		if collider.get_collision_layer_value(1):
			collider.velocity += Vector2(direction*100,-200)
