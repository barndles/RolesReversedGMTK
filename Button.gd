extends Button

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if button_pressed:
		get_tree().paused = true
		self.text = "PLAY"
	else:
		get_tree().paused = false
		self.text = "PAUSED"
	pass
