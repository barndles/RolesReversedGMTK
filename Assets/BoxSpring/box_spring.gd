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

func _ready():
	spr.play("idle")

func _physics_process(delta):
	if not is_on_floor():
		velocity.y += gravity * delta
	else:
		velocity.x *= .9
	move_and_slide()
	
	launch_entities()
	
	if rayL.is_colliding():
		spr.play("Launch_L")
		print("rayL")
	if rayR.is_colliding():
		spr.play("Launch_R")
		print("ray_R")
	if rayU.is_colliding():
		spr.play("Launch_U")
		print("ray_U")
	else:
		spr.play("idle")
func _area_entered():
	pass

func launch_entities():
	pass
