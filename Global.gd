extends Node

signal level_finished

var level_over: bool = false

var score: int = 0


func end_level():
	print("LEVEL ENDED")
	get_tree().paused = true
	level_over = true
	level_finished.emit()
