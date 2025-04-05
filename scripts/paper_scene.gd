class_name PaperScene
extends ColorRect


signal restart
var on: bool = false


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
	show()


func _on_texture_button_pressed() -> void:
	restart.emit()
