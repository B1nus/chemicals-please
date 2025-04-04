extends Control


@onready var conveyor: Conveyor = $ConveyorBelt
@onready var paper_scene: PaperScene = $PaperScene
@onready var clock: Clock = $Clock
@onready var day_timer = $DayTimer
@onready var wait_timer = $WaitTimer
@export var day_time: float = 30.0


func _ready() -> void:
	paper_scene.restart.connect(start_day)
	start_day()


func _process(delta: float) -> void:
	clock.set_time(floor((day_time - day_timer.time_left) / day_time * 12))


func start_day() -> void:
	paper_scene.reset()
	conveyor.speed_up()
	day_timer.start(day_time)


func _on_day_timer_timeout() -> void:
	conveyor.slow_down()
	wait_timer.start()


func _on_wait_timer_timeout() -> void:
	paper_scene.fade()
