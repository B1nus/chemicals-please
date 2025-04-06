class_name SprayCloud
extends Node2D


func _ready() -> void:
	$CPUParticles2D.emitting = true
	$CPUParticles2D.modulate = Global.color_map[Global.chemical]


func _on_cpu_particles_2d_finished() -> void:
	queue_free()
