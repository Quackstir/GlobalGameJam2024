extends VBoxContainer
class_name farmingPlot

@onready var plant_texture = $"Plot Texture/Plant Texture"

@onready var harvest_button = $HarvestButton
@export var completedColor:Color
@export var progressColor:Color
@onready var progress_bar = %ProgressBar
@onready var rich_text_label = %RichTextLabel

@export var harvestTime:float = 10
@export var growthRate:float = 0.1
@onready var currentGrowthRate:float = growthRate
var currentGrowth:float = 0

@onready var water_button = $WaterButton
@export var canWater:bool = false
var isWatered:bool = false

@export var harvestSFXArray:Array[AudioStreamWAV]
@export var waterSFXArray:Array[AudioStreamWAV]
@export var plantSFXArray:Array[AudioStreamWAV]

@onready var harvest_sfx = $HarvestSFX
@onready var harvest_sfx_2 = $HarvestSFX_2
@onready var harvest_sfx_3 = $HarvestSFX_3

@onready var water_plant_sfx = $WaterPlantSFX
@onready var water_plant_sfx_2 = $WaterPlantSFX_2
@onready var water_plant_sfx_3 = $WaterPlantSFX_3

@onready var plant_plant_sfx = $PlantPlantSFX
@onready var plant_plant_sfx_2 = $PlantPlantSFX_2
@onready var plant_plant_sfx_3 = $PlantPlantSFX_3

func _ready():
	rich_text_label.text = "[center]Harvest[/center]"
	progress_bar.modulate = completedColor
	water_button.visible = false

func growing():
	while currentGrowth < harvestTime:
		await get_tree().create_timer(0.013).timeout
		currentGrowth += currentGrowthRate * get_physics_process_delta_time()
		
	if currentGrowth >= harvestTime:
		harvestReady()
		
func _process(delta):
	var a = (100 * (currentGrowth)/harvestTime)
	plant_texture.size.y = a
	progress_bar.value = lerp(progress_bar.value,a,delta * 10)

func harvestReady():
	rich_text_label.text = "[center]Harvest[/center]"
	progress_bar.modulate = completedColor
	harvest_button.disabled = false
	currentGrowthRate = growthRate
	water_button.visible = false

func toggleCanWater(newValue:bool):
	canWater = newValue

func _on_button_3_button_down():
	harvest_button.disabled = true
	harvest_sfx.stream  = harvestSFXArray[randi_range(0,harvestSFXArray.size() - 1)]
	harvest_sfx.play()
	GameManager.I_gameManager.flowerBread += 1
	rich_text_label.text = "[center]Growing[/center]"
	progress_bar.modulate = progressColor
	currentGrowth = 0
	growing()
	progress_bar.value = 0
	
	if canWater:
		water_button.visible = true

func _on_water_button_button_down():
	currentGrowthRate = growthRate * 3
	water_button.visible = false
	water_plant_sfx.stream  = waterSFXArray[randi_range(0,waterSFXArray.size() - 1)]
	water_plant_sfx.play()



#	***EXAMPLE OF PLANTING BUTTON FUNCTIONALITY***

# func _on_PLANT_button_button_down():
#	if plot is currently unoccupied, allow planting 
#	PLANT_button.visible = false
#	plant_plant_sfx.stream  = plantSFXArray[randi_range(0,plantSFXArray.size() - 1)]
#	plant_plant_sfx.play()
