class_name Clothes
extends Node2D


@export var click_distance: float = 60
@export var click_offset: Vector2 = Vector2(-70, -5)
@export var curve: Curve
var color_shift: Vector3 = Vector3(0,0,0)

var textures: Array[Texture] = [
	load("res://assets/textures/tshirt_pink.png"),
	load("res://assets/textures/tshirt_white.png"),
	load("res://assets/textures/tshirt_yellow.png")
]


func _ready() -> void:
	var index = randi_range(0, textures.size() - 1)
	$Sprite2D.texture = textures[index]


func clean() -> void:
	modulate = Color.WHITE


func _process(delta: float) -> void:
	if Input.is_action_just_pressed("click") and (get_global_mouse_position() + click_offset).distance_to(global_position) < click_distance and Global.chemical != null:
		Global.bad_value += Global.bad_value_map[Global.chemical]
		Global.did_nothing = false
		color_shift += Global.color_shift_map[Global.chemical]
		modulate.r = 1.0 - curve.sample(color_shift.x)
		modulate.g = 1.0 - curve.sample(color_shift.y)
		modulate.b = 1.0 - curve.sample(color_shift.z)
