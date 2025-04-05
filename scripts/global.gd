extends Node


var hovering_shelf: bool = false
var chemical: Chemical = Chemical.PFAS
var did_nothing: bool = true
var bad_value: float = 0.0


var bad_value_map: Dictionary[Chemical, float] = {
	Chemical.PFAS: 0.1,
	Chemical.BEEWAX: 0.0,
}


enum Chemical {
	PFAS,
	BEEWAX,
}
