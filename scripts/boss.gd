class_name Boss
extends Node2D


const intro_text: Array[String] = [
	"Ahh, you're new here.",
	"Welcome to QL Clothes.",
	"Just spray the clothes with the chemicals",
	"Are the chemicals bad? Of course not",
	"We at QL Clothes only use the bestest of chemicals",
	"What are you waiting for? GET TO WORK!",
]
const texts: Array[Array] = [
	[
		"Huh, no clothes came out of this factory yesterday.",
		"Do you happen to know why?",
		"Maybe somebody wasn't doing their job...",
		"GET TO WORK!",
	],
	[
		"Our profits doubled yesterday.",
		"Maybe there is something to these non-toxic chemicals.",
		"Well, no point in hanging around, GET TO WORK!",
	],
	[
		"Our earnings went down yestarday.",
		"It seems that people don't like wearing toxic clothes.",
		"Weird huh?",
		"Well, don't worry about it",
		"Just keep spraying those clothes with the chemicals",
	],
	[
		"Had a bit of a disaster yesterday",
		"It seems that or totally non-toxic chemicals are giving people tentacle arms",
		"Weird huh?",
		"Well, don't worry about it",
		"Just keep spraying those clothes with the chemicals",
	],
	[
		"Was a bit of a disaster yesterday",
		"Our chemicals aren't to blame for this.",
		"Don't worry about it",
		"Just keep spraying those clothes with the chemicals",
	],
]
var cur_texts = null
var text_chars: int = 0
var text_id: int = -1
var spray_text = false


func _process(delta: float) -> void:
	if Global.result == null:
		cur_texts = intro_text
	else:
		cur_texts = texts[Global.result]
	if text_id < cur_texts.size():
		if spray_text:
			$RichTextLabel.text = "Don't spray me subordinate.".substr(0, text_chars)
		else:
			$RichTextLabel.text = cur_texts[text_id].substr(0, text_chars)
	text_chars += 1
	if Input.is_action_just_pressed("click") and not Global.hovering_shelf:
		if hovering and Global.chemical != null:
			spray_text = true
			$"boss-cough".play()
		elif text_id < cur_texts.size():
			next_text()


signal start


func next_text() -> void:
	if text_id < cur_texts.size():
		$TextureRect2.show()
		$RichTextLabel.show()
		$"boss-talk".play()
		Global.boss_talking = true
	text_chars = 0
	if not spray_text:
		text_id += 1
	else:
		spray_text = false
	if text_id >= cur_texts.size() and Global.boss_talking:
		$TextureRect2.hide()
		$RichTextLabel.hide()
		$"boss-walk".play()
		Global.boss_talking = false
		start.emit()


var hovering = false
func _on_area_2d_mouse_entered() -> void:
	hovering = true
	Global.boss_hovering = true


func _on_area_2d_mouse_exited() -> void:
	hovering = false
	Global.boss_hovering = false
