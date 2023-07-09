extends ItemList

const simpleEnemy = preload("res://simpleEnemy.tscn")
const flipper = preload("res://flipper.tscn")
const bumper = preload("res://bouncer.tscn")
const boxSpring = preload("res://Assets/BoxSpring/box_spring.tscn")

var spawnables = [flipper, simpleEnemy, bumper, boxSpring]
var cost = [250,50,200,200]
var mouseOnUI = get_node(".").mouseOnUI
var canSpawn = false
var mousePos

var flip = -1

# Called when the node enters the scene tree for the first time.
func _ready():
	
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	mousePos = get_global_mouse_position()
	
	if mousePos.y > 312:
		canSpawn = false
	else:
		canSpawn = true
	
	if Input.is_action_just_pressed("Flip"):
		flip = -flip


func _input(event):
	# Mouse in viewport coordinates.
	if (event.is_pressed() and event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT):
		
		if is_anything_selected():
			var sel = get_selected_items()[0]
			spawn(sel)
	else: 
		pass

func spawn(selection:int):
	if Global.level_over:
		return
	if canSpawn and get_tree().paused:
		Global.score += cost[selection]
		var spawnedObject = spawnables[selection].instantiate()
		spawnedObject.global_position = get_global_mouse_position()
		spawnedObject.scale.x *= flip
		get_tree().root.get_child(1).add_child(spawnedObject)


