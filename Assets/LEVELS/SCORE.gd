extends RichTextLabel

@onready var score = $"."
func _ready():
	score.text = "YOU SPENT $" + str(Global.final_score)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
