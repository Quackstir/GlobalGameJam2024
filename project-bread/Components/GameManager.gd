class_name GameManagerScript extends Node

static var currentInteraction:r_Interaction:
	set(newValue):
		print("New Interaction: " + str(newValue))
		currentInteraction = newValue
static var currentPlot:Plot

var tools
var currentTool

static var money: int:
	set(newValue):
		money = newValue
		print("Money: " + str(money))
