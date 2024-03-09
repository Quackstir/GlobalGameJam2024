extends VBoxContainer

@export var ResourceName:String

@onready var timer = $Timer
@onready var button = $Button
@onready var progress = $Progress

@export var SubtractFrom:String
@export var SubtractAmount:int

var ResourceVariable:GameplayResource = GameplayResource.new()

# Called when the node enters the scene tree for the first time.
func _ready():
	await get_tree().create_timer(0.000000001).timeout
	ResourceVariable.name = ResourceName
	print(ResourceVariable.name)
	progress.max_value = timer.wait_time
	GameManager.I_gameManager.add_resource(ResourceVariable)

func _process(delta):
	progress.value = timer.time_left

func _on_button_button_down():
	ResourceVariable.ResourceValue += 1
	button.disabled = true
	timer.start()

func _on_timer_timeout():
	button.disabled = false
