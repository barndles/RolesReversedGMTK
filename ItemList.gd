extends ItemList

const simpleEnemy = preload("res://simpleEnemy.tscn")
const flipper = preload("res://flipper.tscn")
const bumper = preload("res://bouncer.tscn")
const boxSpring = preload("res://Assets/BoxSpring/box_spring.tscn")

var spawnables = [flipper, simpleEnemy, bumper, boxSpring]
var mouseOnUI = get_node(".").mouseOnUI
var canSpawn = false
var mousePos
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	print(mouseOnUI)
	mousePos = get_global_mouse_position()
	
	if mousePos.y > 312:
		canSpawn = false
	else:
		canSpawn = true


func _input(event):
	# Mouse in viewport coordinates.
	if (event.is_pressed() and event.button_index == MOUSE_BUTTON_LEFT):
		
		if is_anything_selected():
			var sel = get_selected_items()[0]
			spawn(sel)
	else: 
		pass

func spawn(selection:int):
	if canSpawn:
		var spawnedObject = spawnables[selection].instantiate()
		spawnedObject.global_position = get_global_mouse_position()
		get_parent().get_parent().add_child(spawnedObject)


