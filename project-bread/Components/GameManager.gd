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

#const LEVEL_AQUATIC = preload("res://Levels/Level_Aquatic.tscn")
#static var Level_Aquatic_Instance
#
#const LEVEL_DESERT = preload("res://Levels/Level_Desert.tscn")
#static var Level_Desert_Instance
#
#const LEVEL_PLAINS = preload("res://Levels/Level_Plains.tscn")
#static var Level_Plains_Instance
#
#const LEVEL_SWAMP = preload("res://Levels/Level_Swamp.tscn")
#static var Level_Swamp_Instance

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
	
	#Level_Aquatic_Instance = LEVEL_AQUATIC.instantiate()
	#Level_Desert_Instance = LEVEL_DESERT.instantiate()
	#Level_Plains_Instance = LEVEL_PLAINS.instantiate()
	#Level_Swamp_Instance = LEVEL_SWAMP.instantiate()
