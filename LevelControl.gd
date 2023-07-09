extends Control

@export var next_level: PackedScene
@onready var button = $Button
# Called when the node enters the scene tree for the first time.
func _ready():
	Global.level_finished.connect(show_win_screen)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func show_win_screen():
	button.visible = true
	button.text = "YOU SPENT: $" + str(Global.score)
	# print("Hi barndles! 'next_level' is an export variable which means it can be changed per instace of it in a scene. You can see it in the properties when you add it, and click load to set it to another scene.")


func _on_button_button_down():
	Global.score = 0
	Global.level_over = false
	#get_tree().change_scene_to_packed(next_level)
