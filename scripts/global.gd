extends Node


var hovering_shelf: bool = false
var chemical = null
var did_nothing: bool = true
var bad_value: float = 0.0
var paper_scene_on: bool = false
var result = null
var boss_talking = false
var boss_hovering = false
var chemicals = []
var spray_count: int = 0
const spray_min: int = 5


enum Result {
	NOTHING,
	GOOD,
	ALMOST_GOOD,
	BAD,
	REALLY_BAD,
}


const bad_value_map: Array[float] = [
	0.05,
	0.0,
	0.2,
	0.2,
	0.2,
	0.3,
	0.1,
]


const particl_map: Array[int] = [
	0,
	2,
	0,
	1,
	0,
	1,
	0
]


const color_map: Array[Color] = [
	Color.BLACK,
	Color.BLUE,
	Color.BROWN,
	Color.GREEN,
	Color.ORANGE,
	Color.RED,
	Color.YELLOW,
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
