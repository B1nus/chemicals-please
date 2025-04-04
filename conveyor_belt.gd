class_name Conveyor
extends Node2D


var clothes_scene: PackedScene = load("res://clothes.tscn")
@onready var timer = $Timer
@onready var clothes_parent = $Clothes
@onready var end_point = $End
@export var speed = 100.0
@onready var velocity = 0.0
@export var acceleration_scale = 100.0
var acceleration = 0.0


func _physics_process(delta: float) -> void:
	velocity += acceleration_scale * acceleration * delta
	velocity = clampf(velocity, 0.0, speed)
	for child in clothes_parent.get_children():
		child.global_position.x += velocity * delta
		if child.global_position.x > end_point.global_position.x:
			child.queue_free()


func _on_timer_timeout() -> void:
	if velocity == speed:
		var clothes = clothes_scene.instantiate()
		clothes_parent.add_child(clothes)


func speed_up() -> void:
	acceleration = 1.0
	timer.start()


func slow_down() -> void:
	acceleration = -1.0
	timer.stop()
