class_name Clothes
extends Node2D


@export var click_distance: float = 60
@export var click_offset: Vector2 = Vector2(-70, -5)


func _process(delta: float) -> void:
	if Input.is_action_just_pressed("click") and (get_global_mouse_position() + click_offset).distance_to(global_position) < click_distance:
		Global.bad_value += Global.bad_value_map[Global.chemical]
		Global.did_nothing = false
		modulate.g -= 0.1
		modulate.b -= 0.1
