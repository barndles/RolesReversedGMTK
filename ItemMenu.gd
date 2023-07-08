extends Control

const simpleEnemy = preload("res://simpleEnemy.tscn")
const flipper = preload("res://flipper.tscn")
var mousePos
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	mousePos = get_global_mouse_position()
	pass

func _input(event):
	# Mouse in viewport coordinates.
	if (event.is_pressed() and event.button_index == MOUSE_BUTTON_LEFT):
		var flipperInst = flipper.instantiate()
		flipperInst.position = get_global_mouse_position()
		add_child(flipperInst)
	elif event is InputEventMouseMotion:
		print("Mouse Motion at: ", event.position)

	# Print the size of the viewport.
	print("Viewport Resolution is: ", get_viewport_rect().size)
