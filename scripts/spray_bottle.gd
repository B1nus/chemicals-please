extends Node2D


@onready var spray_cloud: PackedScene = load("res://scenes/spraycloud.tscn")
@onready var cloud_spawner = $CloudSpawner
@export var chemical: Global.Chemical
@onready var shelf_position = global_position
const click_distance: float = 30.0
@export var offset: Vector2 = Vector2(5, 5)
@export var idle_image: Texture
@export var spray_image: Texture


func _process(delta: float) -> void:
	$Sprite2D.use_parent_material = false
	$Sprite2D.texture = idle_image
	if Global.chemical == chemical:
		Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
		z_index = 1
		global_position = get_global_mouse_position() + offset
		if Input.is_action_just_pressed("click") and not Global.hovering_shelf:
			cloud_spawner.add_child(spray_cloud.instantiate())
		if Input.is_action_pressed("click") and not Global.hovering_shelf:
			$Sprite2D.texture = spray_image
	else:
		z_index = 0
		global_position = shelf_position
		if global_position.distance_to(get_global_mouse_position()) < click_distance:
			$Sprite2D.use_parent_material = true
			if Input.is_action_just_pressed("click") and not Global.paper_scene_on:
				Global.chemical = chemical
