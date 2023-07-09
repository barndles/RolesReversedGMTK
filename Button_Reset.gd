extends Button


func _process(delta):
	if button_pressed:
		if self.text == "RESTART":
			get_tree().reload_current_scene()
