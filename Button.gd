extends Button

# Called when the node enters the scene tree for the first time.
func _ready():
	get_tree().paused = true


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if button_pressed:
		get_tree().paused = true
		self.text = "PAUSED"
	else:
		get_tree().paused = false
		self.text = "PLAYING"
	pass
