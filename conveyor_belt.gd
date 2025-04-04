extends Node2D


var clothes_scene: PackedScene = load("res://clothes.tscn")


func _on_timer_timeout() -> void:
	var clothes = clothes_scene.instantiate()
	add_child(clothes)
