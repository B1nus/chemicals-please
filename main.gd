extends Node2D


@onready var conveyor: Conveyor = $ConveyorBelt
@onready var day_timer = $DayTimer
@export var day_time: float = 30.0


func _ready() -> void:
	start_day()


func _process(delta: float) -> void:
	pass


func start_day() -> void:
	conveyor.speed_up()
	day_timer.start(day_time)


func _on_day_timer_timeout() -> void:
	conveyor.slow_down()
