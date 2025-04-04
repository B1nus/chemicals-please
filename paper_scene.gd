class_name PaperScene
extends ColorRect


signal restart


func reset() -> void:
	$AnimationPlayer.play("RESET")


func fade() -> void:
	$AnimationPlayer.play("fade")


func _on_button_pressed() -> void:
	restart.emit()
