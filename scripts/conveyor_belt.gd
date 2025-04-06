class_name Conveyor
extends Node2D


var clothes_scene: PackedScene = load("res://scenes/clothes.tscn")
@export var clothes_gap = 200.0
@onready var clothes_parent = $Clothes
@onready var end_point = $End
@export var speed = 100.0
@onready var velocity = 0.0
@export var acceleration_scale = 100.0
var acceleration = 0.0
const error_margin: int = 10


signal chemicals


func _ready() -> void:
	for i in range(1):
		var clothes = clothes_scene.instantiate()
		clothes.position.x += clothes_gap * i
		clothes_parent.add_child(clothes)


func _physics_process(delta: float) -> void:
	$Belt.region_rect.position.x -= velocity * delta
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
	elif not child is Clothes and not child.get_child(0).emitting:
		child.queue_free()


func speed_up() -> void:
	acceleration = 1.0


func slow_down() -> void:
	acceleration = -1.0


func clear_clothes() -> void:
	for child in clothes_parent.get_children():
		if child is Clothes:
			child.clean()
		elif not child.get_child(0).emitting:
			child.queue_free()
		if child.global_position.x > clothes_gap:
			child.queue_free()
