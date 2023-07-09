extends Button

func _process(_delta):
	if Input.is_action_just_pressed("Restart"):
		restart()

func _on_button_down():
	restart()
	
func restart():
	Global.score = 0
	get_tree().reload_current_scene()
