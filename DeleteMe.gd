extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _input_event(viewport, event, shape_idx):
	if (event.is_pressed() and event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_RIGHT):
		get_parent().queue_free()
