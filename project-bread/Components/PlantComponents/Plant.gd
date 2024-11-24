class_name Plant extends Node2D

@onready var timer: Timer = $Timer
@onready var sprite_2d: Sprite2D = $Sprite2D

var EndStageReward:int
var currentStage = 0
var readyToGrow = false

@export var Stages:Array[r_PlantStage]
@onready var rich_text_label: RichTextLabel = $RichTextLabel

var isWatered:bool = false
var isHarvestable:bool = false
