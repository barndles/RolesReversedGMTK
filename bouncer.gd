extends Area2D

func _process(delta):
	$Icon.rotation += .9

func _on_body_entered(body):
	body.velocity = (body.global_position-global_position).normalized() * 300
