extends CharacterBody2D

# Idea for these guys:
# They bounce whatevers in front of them in an arc going behind them (direction can be changed when placing)
# They can be bounced/moved from behind

# perhaps the fellow should ALWAYS face player. This would add some difficulty in preventing player from going in current direction

const SPEED = 300.0
const JUMP_VELOCITY = -400.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

@onready var area_2d = $Area2D
@onready var spr = $AnimatedSprite2D

@onready var rayR = $Triggers/CollisionR
@onready var rayL = $Triggers/CollisionL
@onready var rayU = $Triggers/CollisionU

@onready var bounce_timeout = $BounceTimeout

var durability = 4

func _ready():
	spr.play("idle")

func _physics_process(delta):
	if not is_on_floor():
		velocity.y += gravity * delta
	else:
		velocity.x *= .9
	move_and_slide()
	
	launch_entities()
	
	if rayL.is_colliding() and spr.animation != "Launch_L":
		spr.play("Launch_L")
	if rayR.is_colliding() and spr.animation != "Launch_R":
		spr.play("Launch_R")
	if rayU.is_colliding() and spr.animation != "Launch_U":
		spr.play("Launch_U")
	
func _area_entered():
	pass

func launch_entities():
	for ray in [rayL,rayR,rayU]:
		if bounce_timeout.time_left > 0:
			continue
		if !ray.is_colliding():
			continue
		var obj = ray.get_collider()
		if !(obj is CollisionObject2D):
			continue
		ray.get_collider().velocity += ((ray.get_collision_point()-ray.global_position).normalized() + Vector2(0, 0.2)) * 600
#		if obj.get_collision_layer_value(4):
#			Global.score += 100
#		durability -= 1
#		if durability == 0:
#			queue_free()
		bounce_timeout.start()

func _on_animated_sprite_2d_animation_finished():
	spr.play("idle")
