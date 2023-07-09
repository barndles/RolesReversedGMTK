extends CharacterBody2D

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

@onready var direction: int = scale.x
var durability = 3
var speed: float = 10
@onready var spr = $Icon
@onready var bounce_timeout = $BounceTimeout
func _physics_process(delta):
	# Add the gravity.
	
	handle_collisions()
	
	spr.play("walk")
	
	if velocity.x > 0:
		spr.flip_h = false
	else:
		spr.flip_h = true
	
	if is_on_wall():
		direction = -direction
	elif velocity.x != 0:
		direction = sign(velocity.x)
	
	if is_on_floor():
		velocity.x += direction * speed
		velocity.x *= .9
	else:
		velocity.y += gravity * delta
	
	move_and_slide()

func handle_collisions():
	for collision_index in get_slide_collision_count():
		if bounce_timeout.time_left > 0:
			continue
		var collision: KinematicCollision2D = get_slide_collision(collision_index)
		var collider = collision.get_collider()
		if !(collider is CollisionObject2D):
			continue
		collider.velocity += Vector2(direction*100,-200)
		if collider.get_collision_layer_value(4):
			Global.score += 100
		durability -= 1
		if durability == 0:
			queue_free()
		bounce_timeout.start()
