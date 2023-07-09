extends Button

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if button_pressed:
		if self.text == "RESTART":
			Global.score = 0
			get_tree().reload_current_scene()
		get_tree().paused = true
		self.text = "PLAY"
	else:
		get_tree().paused = false
		self.text = "PAUSED"
	pass
