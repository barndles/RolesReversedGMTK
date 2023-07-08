extends Control

@export var mouseOnUI = false

func _on_item_list_mouse_entered():
	mouseOnUI = true


func _on_item_list_mouse_exited():
	mouseOnUI = false


func _on_panel_mouse_entered():
	mouseOnUI = true


func _on_panel_mouse_exited():
	mouseOnUI = false


func _on_button_mouse_entered():
	mouseOnUI = true


func _on_button_mouse_exited():
	mouseOnUI = false
