class_name Plant extends Node2D

@onready var timer: Timer = $Timer
@onready var sprite_2d: Sprite2D = $Sprite2D

var EndStageReward:int
var currentStage = 0
var readyToGrow = false

@export var Stages:Array[r_PlantStage]
@onready var rich_text_label: RichTextLabel = $RichTextLabel


var isWatered:bool = false

func _ready() -> void:
	setStage()
	
func setStage():
	sprite_2d.texture = Stages[currentStage].Sprite
	timer.wait_time = Stages[currentStage].TimeToGrow
	EndStageReward = Stages[currentStage].RewardMoney

func _begin_stage():
	GameManagerScript.money += EndStageReward
	currentStage += 1
	readyToGrow = false
	if currentStage < Stages.size():
		rich_text_label.text = "Water Me"
		setStage()
	else:
		queue_free()

func _on_timer_timeout() -> void:
	#sprite_2d.self_modulate = Color.GREEN
	#rich_text_label.text = "Harvest me"
	isWatered = false
	readyToGrow = true
