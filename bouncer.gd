extends Area2D

@onready var spr = $AnimatedSprite2D

var durability = 4

@onready var bounce_timeout = $BounceTimeout

func _ready():
	spr.play("spin")

#func _process(delta):
	#$Icon.rotation += .9

#func _on_Area2D_body_entered(body):


func _on_body_entered(body):
	bounce((body.global_position-global_position).normalized() * 270, body)

func bounce(dir:Vector2, target):
	if bounce_timeout.time_left > 0:
		return
	
	target.velocity = Vector2(dir.x,dir.y*.5-200)
	durability -= 1
	Global.score += 100
	if durability == 0:
		queue_free()
	bounce_timeout.start()
