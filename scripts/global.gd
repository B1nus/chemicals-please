extends Node


var hovering_shelf: bool = false
var chemical = null
var did_nothing: bool = true
var bad_value: float = 0.0


const bad_value_map: Dictionary[Chemical, float] = {
	Chemical.PFAS: 0.1,
	Chemical.BEEWAX: 0.0,
}


const color_shift_map: Dictionary[Chemical, Vector3] = {
	Chemical.PFAS: Vector3(0.1,0,0),
	Chemical.BEEWAX: Vector3(0,0.05,0.05),
}


enum Chemical {
	PFAS,
	BEEWAX,
}
