class_name Plant extends Node2D

@onready var timer: Timer = $Timer
@onready var sprite_2d: Sprite2D = $Sprite2D

@export var maxStages:int
var currentStage:int

var isWatered:bool = false:
	set(newValue):
		isWatered = newValue
		if isWatered:
			sprite_2d.self_modulate = Color.TEAL
			_begin_stage()
			timer.start()

func _begin_stage():
	#GameManager.money
	GameManagerScript.money += 10
	#GameManager.tools

func _on_timer_timeout() -> void:
	sprite_2d.self_modulate = Color.GREEN
	isWatered = false
