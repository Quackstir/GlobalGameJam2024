class_name GameManagerScript extends Node

var tools
var currentTool

static var money: int:
	set(newValue):
		money = newValue
		print("Money: " + str(money))
