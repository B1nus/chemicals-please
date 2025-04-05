extends Control


@onready var conveyor: Conveyor = $ConveyorBelt
@onready var paper_scene: PaperScene = $PaperScene
@onready var boss: Boss = $Boss
@onready var clock: Clock = $Clock
@onready var day_timer = $DayTimer
@onready var wait_timer = $WaitTimer
@export var day_time: float = 60.0
var chemical = Global.chemical


func _ready() -> void:
	paper_scene.restart.connect(start_day)
	paper_scene.reset()
	boss.start.connect(start_day)
	boss.start.connect($AnimationPlayer.play_backwards.bind("boss"))
	$AnimationPlayer.play("boss")


func _process(delta: float) -> void:
	clock.set_time(floor((day_time - day_timer.time_left) / day_time * 12))


func start_day() -> void:
	Global.chemical = chemical
	paper_scene.fade_out()
	conveyor.speed_up()
	day_timer.start(day_time)
	conveyor.clear_clothes()
	Global.bad_value = 0.0
	Global.did_nothing = true


func _on_day_timer_timeout() -> void:
	conveyor.slow_down()
	wait_timer.start()


func _on_wait_timer_timeout() -> void:
	chemical = Global.chemical
	paper_scene.fade()


func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	if boss.text_id == -1:
		boss.next_text()
	else:
		boss.queue_free()
