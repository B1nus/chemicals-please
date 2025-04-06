extends Control


@onready var conveyor: Conveyor = $ConveyorBelt
@onready var paper_scene: PaperScene = $PaperScene
@onready var boss: Boss = $Boss
@onready var clock: Clock = $Clock
@onready var day_timer = $DayTimer
@onready var wait_timer = $WaitTimer
@export var day_time: float = 60.0


func _ready() -> void:
	paper_scene.restart.connect(boss_walk)
	paper_scene.reset()
	boss_walk()


func _process(delta: float) -> void:
	clock.set_time(floor((day_time - day_timer.time_left) / day_time * 12))


func boss_walk() -> void:
	boss.text_id = -1
	paper_scene.fade_out()
	conveyor.clear_clothes()
	boss.show()
	boss.start.connect(start_day)
	boss.start.connect($AnimationPlayer.play_backwards.bind("boss"))
	$AnimationPlayer.play("boss")


func start_day() -> void:
	conveyor.speed_up()
	day_timer.start(day_time)
	Global.bad_value = 0.0
	Global.did_nothing = true


func _on_day_timer_timeout() -> void:
	conveyor.slow_down()
	wait_timer.start()


func _on_wait_timer_timeout() -> void:
	$"shift-end".play()
	paper_scene.fade()


func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	if boss.text_id < boss.texts.size():
		boss.next_text()
	else:
		boss.hide()
