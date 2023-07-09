extends Button

func _ready():
	get_tree().paused = true

func _process(_delta):
	if Input.is_action_just_pressed("Pause"):
		pause()

func _on_button_down():
	pause()

func pause():
	if Global.level_over:
		return
	get_tree().paused = !get_tree().paused
	if get_tree().paused:
		self.text = "PAUSED"
	else:
		self.text = "PLAYING"
