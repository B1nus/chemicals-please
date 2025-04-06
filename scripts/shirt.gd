class_name Clothes
extends Node2D


@export var click_distance: float = 80
@export var click_offset: Vector2 = Vector2(-60, -5)
@export var curve: Curve
@onready var shirt_cloud: PackedScene = load("res://scenes/shirtcloud.tscn")
var color_shift: Color = Color.BLACK

var textures: Array[Texture] = [
	load("res://assets/textures/tshirt_pink.png"),
	load("res://assets/textures/tshirt_white.png"),
	load("res://assets/textures/tshirt_yellow.png")
]


func _ready() -> void:
	var index = randi_range(0, textures.size() - 1)
	$Sprite2D.texture = textures[index]


func clean() -> void:
	color_shift = Color.BLACK
	modulate = Color.WHITE


func _process(delta: float) -> void:
	if Input.is_action_just_pressed("click") and (get_global_mouse_position() + click_offset).distance_to(global_position) < click_distance and Global.chemical != null:
		Global.bad_value += Global.bad_value_map[Global.chemical]
		Global.did_nothing = false
		var shift_color = Color.WHITE - Global.color_map[Global.chemical]
		color_shift += shift_color * 0.25
		modulate.r = 1.0 - curve.sample(color_shift.r)
		modulate.g = 1.0 - curve.sample(color_shift.g)
		modulate.b = 1.0 - curve.sample(color_shift.b)
		
		var new_shirt_cloud = shirt_cloud.instantiate()
		new_shirt_cloud.get_child(0).modulate = Global.color_map[Global.chemical]
		new_shirt_cloud.get_child(0).emitting = true
		get_parent().add_child(new_shirt_cloud)
		new_shirt_cloud.global_position = global_position
