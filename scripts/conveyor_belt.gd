class_name Conveyor
extends Node2D


var clothes_scene: PackedScene = load("res://clothes.tscn")
@export var clothes_gap = 100.0
@onready var clothes_parent = $Clothes
@onready var end_point = $End
@export var speed = 100.0
@onready var velocity = 0.0
@export var acceleration_scale = 100.0
var acceleration = 0.0


func _ready() -> void:
	for i in range(2):
		var clothes = clothes_scene.instantiate()
		clothes.position.x += clothes_gap * i
		clothes_parent.add_child(clothes)


func _physics_process(delta: float) -> void:
	velocity += acceleration_scale * acceleration * delta
	velocity = clampf(velocity, 0.0, speed)
	var min_x = INF
	for child in clothes_parent.get_children():
		translate_child(child, delta)
		min_x = min(min_x, child.position.x)
	if min_x > clothes_gap:
		var clothes = clothes_scene.instantiate()
		clothes.position.x = min_x - clothes_gap
		clothes_parent.add_child(clothes)


func translate_child(child: Node2D, delta: float) -> void:
	child.global_position.x += velocity * delta
	if child.global_position.x > end_point.global_position.x:
		child.queue_free()


func speed_up() -> void:
	acceleration = 1.0


func slow_down() -> void:
	acceleration = -1.0
