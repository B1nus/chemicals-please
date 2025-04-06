class_name Boss
extends Node2D


const texts: Array[String] = [
	"Ahh, you're new here.",
	"Welcome to QL Clothes.",
	"Just spray the clothes with the chemicals",
	"Are the chemicals bad? Of course not",
	"We at QL Clothes only use the bestest of chemicals",
	"What are you waiting for? GET TO WORK!",
]
var text_chars: int = 0
var text_id: int = -1
var spray_text = false


func _process(delta: float) -> void:
	if text_id < texts.size():
		if spray_text:
			$RichTextLabel.text = "Don't spray me subordinate.".substr(0, text_chars)
		else:
			$RichTextLabel.text = texts[text_id].substr(0, text_chars)
	text_chars += 1
	if Input.is_action_just_pressed("click"):
		if hovering and Global.chemical != null:
			spray_text = true
			$"boss-cough".play()
		elif text_id < texts.size():
			next_text()


signal start


func next_text() -> void:
	if text_id < texts.size():
		$TextureRect2.show()
		$RichTextLabel.show()
		$"boss-talk".play()
	text_chars = 0
	if not spray_text:
		text_id += 1
	else:
		spray_text = false
	if text_id >= texts.size():
		$TextureRect2.hide()
		$RichTextLabel.hide()
		$"boss-walk".play()
		start.emit()


var hovering = false
func _on_area_2d_mouse_entered() -> void:
	hovering = true


func _on_area_2d_mouse_exited() -> void:
	hovering = false
