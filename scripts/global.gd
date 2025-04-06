extends Node


var hovering_shelf: bool = false
var chemical = null
var did_nothing: bool = true
var bad_value: float = 0.0
var paper_scene_on: bool = false


const bad_value_map: Array[float] = [
	0.05,
	0.0,
	1.0,
	0.2,
	5.0,
	0.5,
	0.1,
]


const color_shift_map: Array[Vector3] = [
	Vector3(0.1,0,0),
	Vector3(0,0.05,0.05),
	Vector3(0.1, 0.1, 0.1),
	Vector3(0.1, 0.1, 0.1),
	Vector3(0.1, 0.1, 0.1),
	Vector3(0.1, 0.1, 0.1),
	Vector3(0.1, 0.1, 0.1),
]


enum Chemical {
	BLACK,
	BLUE,
	BROWN,
	GREEN,
	ORANGE,
	RED,
	YELLOW,
}
