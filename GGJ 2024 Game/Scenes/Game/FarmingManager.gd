extends Node2D
class_name FarmingManager

@export var allPlots:Array[farmingPlot]

func _ready():
	for plot:farmingPlot in allPlots:
		plot.toggleCanWater(false)

func enableWatering():
	for plot:farmingPlot in allPlots:
		plot.toggleCanWater(true)

func _on_button_button_down():
	enableWatering()
