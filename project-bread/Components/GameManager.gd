class_name GameManagerScript extends Node

static var _gameManager:GameManagerScript

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
