class_name Clothes
extends Node2D


@export var click_distance: float = 30
var clicked = false


func _process(delta: float) -> void:
	if Input.is_action_just_pressed("click") and get_global_mouse_position().distance_to(global_position) < click_distance:
		clicked = true
