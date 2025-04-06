extends Node2D


@onready var spray_cloud: PackedScene = load("res://scenes/spraycloud.tscn")
@onready var cloud_spawner = $CloudSpawner
@export var chemical: Global.Chemical
@onready var shelf_position = global_position
const click_distance: Vector2 = Vector2(15, 20)
@export var idle_image: Texture
@export var spray_image: Texture


func _process(delta: float) -> void:
	$Sprite2D.use_parent_material = false
	$Sprite2D.texture = idle_image
	if Global.chemical == chemical:
		$Sprite2D.scale = Vector2(1.0, 1.0)
		Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
		z_index = 1
		global_position = get_global_mouse_position()
		if Input.is_action_just_pressed("click") and not Global.hovering_shelf and not (Global.boss_talking and not Global.boss_hovering):
			cloud_spawner.add_child(spray_cloud.instantiate())
		if Input.is_action_pressed("click") and not Global.hovering_shelf and not (Global.boss_talking and not Global.boss_hovering):
			$Sprite2D.texture = spray_image
	else:
		$Sprite2D.scale = Vector2(0.65, 0.65)
		z_index = 0
		global_position = shelf_position
		var dist_x = abs(global_position.x - get_global_mouse_position().x)
		var dist_y = abs(global_position.y - get_global_mouse_position().y)
		if dist_x < click_distance.x and dist_y < click_distance.y:
			$Sprite2D.use_parent_material = true
			if Input.is_action_just_pressed("click") and not Global.paper_scene_on:
				Global.chemical = chemical
