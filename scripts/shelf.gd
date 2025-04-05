extends Node2D


func _on_area_2d_mouse_entered() -> void:
	Global.hovering_shelf = true


func _on_area_2d_mouse_exited() -> void:
	Global.hovering_shelf = false
