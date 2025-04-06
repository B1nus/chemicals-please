class_name PaperScene
extends Control


signal restart
var on: bool = false

var images: Array[Texture] = [
	load("res://assets/textures/newspaper_happy.png"),
	load("res://assets/textures/newspaper_happy.png"),
	load("res://assets/textures/newspaper_disease.png"),
	load("res://assets/textures/newspaper_disease.png"),
	load("res://assets/textures/newspaper_disease.png"),
]
const nothing_text = [
	"Excessive nudity in the city!",
	"Police arrested hundreds of people who were wandering around the city without clothes, as there were no clothes in the shops in the morning and they already threw out yesterday's set."
]
const texts = [
	[
		"All is well",
		"People are very happy with their t-shirts from QL Clothes! 'I just love QL Clothes' says citizen.",
	],
	[
		"Disease sighted!",
		"After we defeated Covid a new disease is spreading! Ugly rashes can appear on any body parts. Buy Ql Clothes, it will hide the rashes!",
	],
	[
		"Tenctacles instead of arms!",
		"Some people have started to grow tentacles instead of arms. Police suspects Ql Clothes factory, they are denying any wrongdoing!",
	],
	[
		"Aliens are walking among us!",
		"Humanity met with aliens, right here in the city! The tentacled horrifying beings are seemingly all very fond of Ql Clothes' products.",
	],
]


func fade_out() -> void:
	if on:
		$AnimationPlayer.play_backwards("fade")
		on = false


func reset() -> void:
	$AnimationPlayer.play("RESET")


func fade() -> void:
	$AnimationPlayer.play("fade")
	on = true
	print(Global.did_nothing, Global.bad_value)
	var id = min(ceil(Global.bad_value), texts.size() - 1)
	if Global.did_nothing:
		Global.result = Global.Result.NOTHING
		$Header.text = nothing_text[0]
		$Content.text = nothing_text[1]
	else:
		Global.result = Global.Result.GOOD + id
		$Header.text = texts[id][0]
		$Content.text = texts[id][1]
	$TextureRect.texture = images[Global.result]
	show()


func _process(delta: float) -> void:
	Global.paper_scene_on = on
	if on:
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	$TextureButton.disabled = not on


func _on_texture_button_pressed() -> void:
	restart.emit()
