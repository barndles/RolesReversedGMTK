extends ItemList




const simpleEnemy = preload("res://simpleEnemy.tscn")
const flipper = preload("res://flipper.tscn")
const bumper = preload("res://bouncer.tscn")

var spawnables = [flipper, simpleEnemy, bumper]
var canSpawn = false
var mousePos
# Called when the node enters the scene tree for the first time.
func _ready():
	##self._on_panel_mouse_entered().connect(mouseState)
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
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
	if canSpawn:
		var spawnedObject = spawnables[selection].instantiate()
		spawnedObject.global_position = get_global_mouse_position()
		get_parent().get_parent().add_child(spawnedObject)

# func mouseState():
	#pass

func _on_panel_mouse_entered():
	print("mouse_entered")
	canSpawn = false
	
func _on_panel_mouse_exited():
	print("mouse_excited")
	canSpawn = true
