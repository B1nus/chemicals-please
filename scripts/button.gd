extends TextureButton


func _process(delta: float) -> void:
	$RichTextLabel.position.y = 20 + int(button_pressed) * 3
