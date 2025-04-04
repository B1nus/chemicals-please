extends Node2D


@export var speed: float = 100.0
@export var end: float = 600.0
@export var click_distance: float = 50.0
var sprayed: bool = false


func _physics_process(delta: float) -> void:
	global_position.x += speed * delta
	if global_position.x > end:
		queue_free()


func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.is_pressed() and global_position.distance_to(get_global_mouse_position()) < click_distance:
		sprayed = true
