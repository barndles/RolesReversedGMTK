extends CharacterBody2D

# Idea for these guys:
# They bounce whatevers in front of them in an arc going behind them (direction can be changed when placing)
# They can be bounced/moved from behind

# perhaps the fellow should ALWAYS face player. This would add some difficulty in preventing player from going in current direction

const SPEED = 300.0
const JUMP_VELOCITY = -400.0
@onready var spr = $Flipper
# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

var durability = 3 

@onready var flip_timeout = $FlipTimeout

@onready var area_2d = $Area2D



func _physics_process(delta):
	if not is_on_floor():
		velocity.y += gravity * delta
	else:
		velocity.x *= .9
	move_and_slide()
	
	launch_entities()

func launch_entities():
	if not (is_on_floor() or velocity.y < 0):
		return
	for body in area_2d.get_overlapping_bodies():
		if not (body is CollisionObject2D):
			continue
		if body == self:
			continue
#		if flip_timeout.time_left > 0:
#			continue
		body.velocity = Vector2(-100 * transform.get_scale().y,-500)
		spr.play("flippity")
#		durability -= 1
#		if body.get_collision_layer_value(4):
#			Global.score += 100
#		if durability == 0:
#			queue_free()
#		flip_timeout.start()
		#print(transform.get_scale().y)
