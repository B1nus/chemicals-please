extends Node2D


func _process(delta: float) -> void:
	global_position = get_global_mouse_position()
	$AnimatedSprite2D.frame = Input.is_action_pressed("click")
