extends Area2D

@onready var spr = $AnimatedSprite2D

func _ready():
	spr.play("spin")

#func _process(delta):
	#$Icon.rotation += .9

#func _on_Area2D_body_entered(body):


func _on_body_entered(body):
	bounce((body.global_position-global_position).normalized() * 270, body)

func bounce(dir:Vector2, target):
	var timer = 10
	if timer > 0:
		for n in range(timer):
			target.velocity = dir
			timer -= 1
