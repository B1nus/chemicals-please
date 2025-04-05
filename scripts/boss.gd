class_name Boss
extends Node2D


const texts: Array[String] = [
	"Ahh, you're new here.",
	"Welcome to Ethical Corp.",
	"Just spray the clothes with the chemicals",
	"Are the chemicals bad? Of course not",
	"We at Ethical Corp only use the bestest of chemicals",
	"What are you waiting for? GET TO WORK!",
]
var text_chars: int = 0
var text_id: int = -1


func _process(delta: float) -> void:
	if text_id < texts.size():
		$RichTextLabel.text = texts[text_id].substr(0, text_chars)
	text_chars += 1
	if Input.is_action_just_pressed("click") and text_id > -1 and text_id < texts.size():
		next_text()


signal start


func next_text() -> void:
	if text_id < texts.size():
		$TextureRect2.show()
		$RichTextLabel.show()
		$AudioStreamPlayer.play()
	text_chars = 0
	text_id += 1
	if text_id >= texts.size():
		$TextureRect2.hide()
		$RichTextLabel.hide()
		start.emit()
