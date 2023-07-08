extends ItemList

const simpleEnemy = preload("res://simpleEnemy.tscn")
const flipper = preload("res://flipper.tscn")
const bumper = preload("res://bouncer.tscn")

var spawnables = [flipper, simpleEnemy, bumper]
var mouseOnUI = get_node(".").mouseOnUI
var mousePos
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	print(mouseOnUI)
	mousePos = get_global_mouse_position()

func _input(event):
	# Mouse in viewport coordinates.
	if (event.is_pressed() and event.button_index == MOUSE_BUTTON_LEFT):
		
		if is_anything_selected():
			var sel = get_selected_items()[0]
			spawn(sel)
		
	elif event is InputEventMouseMotion:
		pass

func spawn(selection:int):
	if !mouseOnUI:
		var spawnedObject = spawnables[selection].instantiate()
		spawnedObject.global_position = get_global_mouse_position()
		get_parent().get_parent().add_child(spawnedObject)

