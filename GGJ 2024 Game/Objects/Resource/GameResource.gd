extends VBoxContainer

@export var ResourceName:String

@onready var timer = $Timer
@onready var button = $Button
@onready var progress = $Progress

@export var SubtractFrom:String
@export var SubtractAmount:int
@export var coolDownTime:float = 0.5

var ResourceVariable:GameplayResource = GameplayResource.new()
var ResourceDepleteFrom:GameplayResource

# Called when the node enters the scene tree for the first time.
func _ready():
	await get_tree().create_timer(0.000000001).timeout
	ResourceVariable.name = ResourceName
	print(ResourceVariable.name)
	GameManager.I_gameManager.add_resource(ResourceVariable)
	button.text = ResourceName
	timer.wait_time = coolDownTime
	progress.max_value = timer.wait_time
	if SubtractFrom == "": return
	findResourceDeplete()

func findResourceDeplete():
	await get_tree().create_timer(0.000000001).timeout	
	for resource in GameManager.I_gameManager.gameResource:
		print(resource.name)
		if resource.name == SubtractFrom:
			ResourceDepleteFrom = resource
			print(resource.name + "GOT THIS")
			resource.ResourceChanged.connect(depleteResourceUpdate)
			button.disabled = true
			return
			
func depleteResourceUpdate(resourceValue:int):
	button.disabled = resourceValue < SubtractAmount

func _process(delta):
	progress.value = timer.time_left

func _on_button_button_down():
	if SubtractFrom != "":
		subtract_from_Resource()
		return
	add_resouce_amount()

func _on_timer_timeout():
	if SubtractFrom == "":
		button.disabled = false
	
func subtract_from_Resource():
	if ResourceDepleteFrom.ResourceValue < SubtractAmount: return
	ResourceDepleteFrom.ResourceValue -= SubtractAmount
	add_resouce_amount()

func add_resouce_amount():
	ResourceVariable.ResourceValue += 1
	button.disabled = true
	timer.start()
	
