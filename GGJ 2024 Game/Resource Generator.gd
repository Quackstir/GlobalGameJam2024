extends VBoxContainer

@export var gameManager:GameManager
var isBought:bool = false
@export var resourceGeneratedLabel:PackedScene
@onready var node_2d = $Node2D
@export var TimeToGenerate: float

@export_category("Appear at Amount")
@export var Appear_BreadFlower: int
@export var Appear_BreadFlour: int
@export var Appear_FlowerBread: int

@export_category("Costs")
@export var Cost_BreadFlower: int
@export var CostIncrease_BreadFlower: int
@export var Cost_BreadFlour: int
@export var CostIncrease_BreadFlour: int
@export var Cost_FlowerBread: int
@export var CostIncrease_FlowerBread: int

@export_category("Generates")
@onready var Generates_BreadFlower: int = InitialGenerates_BreadFlower
@export var InitialGenerates_BreadFlower: int
@onready var Generates_BreadFlour: int = InitialGenerates_BreadFlour
@export var InitialGenerates_BreadFlour: int
@onready var Generates_FlowerBread: int = InitialGenerates_FlowerBread
@export var InitialGenerates_FlowerBread: int
var generatorAmount = 0

@export_category("Nodes")
@onready var time_to_add = $"Time to Add"
@onready var generator_button = $"Generator Button"
@onready var generator_progress_bar = $"Generator Progress Bar"
@export var Text_BeforePurchase: String
@export var Text_Generates: String

# Called when the node enters the scene tree for the first time.
func _ready():
	generator_button.text = Text_BeforePurchase
	time_to_add.wait_time = TimeToGenerate

func _process(delta):
	generator_progress_bar.value = time_to_add.time_left
	
	if (gameManager.BreadFlower < Appear_BreadFlower): return
	if (gameManager.BreadFlour < Appear_BreadFlour): return
	if (gameManager.FlowerBread < Appear_FlowerBread): return
	visible = true

func _on_generator_button_button_down():
	if (gameManager.BreadFlower < Cost_BreadFlower): return
	if (gameManager.BreadFlour < Cost_BreadFlour): return
	if (gameManager.FlowerBread < Cost_FlowerBread): return
	
	_update_costs()
	
	generatorAmount += 1
	
	time_to_add.start()
	
	_update_generation()
	_update_strings()
	generator_progress_bar.max_value = time_to_add.wait_time

func _on_time_to_add_timeout():
	var breadFlowerDelta = Generates_BreadFlower
	var breadFlourDelta = Generates_BreadFlour
	var flowerBreadDelta = Generates_FlowerBread
	
	gameManager.BreadFlower += breadFlowerDelta
	gameManager.BreadFlour += breadFlourDelta
	gameManager.FlowerBread += flowerBreadDelta 
	
	#gameManager.BreadFlower -= gameManager.FlowerToBreadFlour * generatorAmount
	#gameManager.BreadFlour -= gameManager.FlourToFlowerBread * generatorAmount
	
	#breadFlowerDelta -= gameManager.FlowerToBreadFlour * generatorAmount
	#breadFlourDelta -= gameManager.FlourToFlowerBread * generatorAmount
	
	var resourceLabel = resourceGeneratedLabel.instantiate()
	get_tree().get_root().add_child(resourceLabel)
	resourceLabel.position = node_2d.global_position
	
	var format_string = "+ %s Bread Flower \n+ %s Bread Flour \n+ %s Flower Bread"
	var actual_string = format_string % [str(Generates_BreadFlower), str(Generates_BreadFlour), str(Generates_FlowerBread)]
	
	resourceLabel.text = actual_string

func _update_costs():
	gameManager.BreadFlower -= Cost_BreadFlower
	gameManager.BreadFlour -= Cost_BreadFlour
	gameManager.FlowerBread -= Cost_FlowerBread
	
	Cost_BreadFlower += CostIncrease_BreadFlower
	Cost_BreadFlour += CostIncrease_BreadFlour
	Cost_FlowerBread += CostIncrease_FlowerBread

func _update_generation():
	Generates_BreadFlower = InitialGenerates_BreadFlower * generatorAmount
	Generates_BreadFlour = InitialGenerates_BreadFlour * generatorAmount
	Generates_FlowerBread = InitialGenerates_FlowerBread * generatorAmount
	
func _update_strings():
	generator_button.text = str(generatorAmount) + " " + Text_Generates
	var format_string = "Cost %s Bread Flower \nCost %s Bread Flour \nCost %s Flower Bread"
	var actual_string = format_string % [str(Cost_BreadFlower), str(Cost_BreadFlour), str(Cost_FlowerBread)];
	generator_button.tooltip_text = actual_string
