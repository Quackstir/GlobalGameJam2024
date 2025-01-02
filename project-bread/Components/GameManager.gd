class_name GameManagerScript extends Node

static var _gameManager:GameManagerScript

const MUSIC_MANAGER = preload("res://Sound/Music/MusicManager.tscn")
var MusicManager_Instance:MusicManager

const HUD_PRELOAD = preload("res://UI/HUD/HUD.tscn")
var HUD_Instance:HUD

static var currentInteraction:r_Interaction:
	set(newValue):
		print("New Interaction: " + str(newValue))
		currentInteraction = newValue
static var currentPlot:Plot

var tools
var currentTool

signal moneyChanged(moneyValue)

var money: int: set = setMoney

func setMoney(newValue):
	money = newValue
	print("Money: " + str(money))
	emit_signal("moneyChanged",money)
	
	
func _ready() -> void:
	if _gameManager == null:
		_gameManager = self
	else:
		queue_free()

	MusicManager_Instance = MUSIC_MANAGER.instantiate()
	add_child(MusicManager_Instance)
	
	HUD_Instance = HUD_PRELOAD.instantiate()
	add_child(HUD_Instance)
