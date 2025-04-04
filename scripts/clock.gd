class_name Clock
extends Node2D


func set_time(time: int) -> void:
	$AnimatedSprite2D.frame = time % 12
