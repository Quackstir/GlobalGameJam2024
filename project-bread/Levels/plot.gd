class_name Plot extends Sprite2D

@onready var plot: Sprite2D = $"."
@export var PlantObject:PackedScene
var currentPlant:Plant

#@export var harvestSFXArray:Array[AudioStreamWAV]
#@export var waterSFXArray:Array[AudioStreamWAV]
#@export var plantSFXArray:Array[AudioStreamWAV]
#
#@onready var harvest_sfx = $HarvestSFX
#@onready var harvest_sfx_2 = $HarvestSFX_2
#@onready var harvest_sfx_3 = $HarvestSFX_3
#
#@onready var water_plant_sfx = $WaterPlantSFX
#@onready var water_plant_sfx_2 = $WaterPlantSFX_2
#@onready var water_plant_sfx_3 = $WaterPlantSFX_3
#
#@onready var plant_plant_sfx = $PlantPlantSFX
#@onready var plant_plant_sfx_2 = $PlantPlantSFX_2
#@onready var plant_plant_sfx_3 = $PlantPlantSFX_3

func _on_button_pressed() -> void:
	if GameManagerScript.currentInteraction != null:
		GameManagerScript.currentInteraction.interactionFunction(self)
	if currentPlant == null: return
	if currentPlant.isHarvestable:
		currentPlant.queue_free()

func _on_button_focus_entered() -> void:
	GameManagerScript.currentPlot = self
	plot.self_modulate = Color.YELLOW

func _on_button_focus_exited() -> void:
	plot.self_modulate = Color.WHITE

func _on_button_mouse_entered() -> void:
	_on_button_focus_entered()


func _on_button_mouse_exited() -> void:
	_on_button_focus_exited()



#func _on_button_3_button_down():
	#harvest_button.disabled = true
	#HARVEST_SFX.STREAM  = HARVESTSFXARRAY[RANDI_RANGE(0,HARVESTSFXARRAY.SIZE() - 1)]
	#HARVEST_SFX.PLAY()
	#GameManager.I_gameManager.flowerBread += 1
	#rich_text_label.text = "[center]Growing[/center]"
	#progress_bar.modulate = progressColor
	#currentGrowth = 0
	#growing()
	#progress_bar.value = 0
	#
	#if canWater:
		#water_button.visible = true
		
		
		
		
		#func _on_water_button_button_down():
	#currentGrowthRate = growthRate * 3
	#water_button.visible = false
	#WATER_PLANT_SFX.STREAM  = WATERSFXARRAY[RANDI_RANGE(0,WATERSFXARRAY.SIZE() - 1)]
	#WATER_PLANT_SFX.PLAY()
	
	
	
	
	#	***EXAMPLE OF PLANTING BUTTON FUNCTIONALITY***

# func _on_PLANT_button_button_down():
#	if plot is currently unoccupied, allow planting 
#	PLANT_button.visible = false
#	PLANT_PLANT_SFX.STREAM  = PLANTSFXARRAY[RANDI_RANGE(0,PLANTSFXARRAY.SIZE() - 1)]
#	PLANT_PLANT_SFX.PLAY()
