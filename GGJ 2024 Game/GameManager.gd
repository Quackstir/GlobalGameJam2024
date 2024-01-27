extends Node2D

var BreadFlower: int = 0:
	set(new_value):
		bread_flower_text.text = "Bread Flower: " + str(new_value)
		BreadFlower = new_value
	get:
		return BreadFlower

var BreadFlour: int = 0:
	set(new_value):
		bread_flour_text.text = "Bread Flour: " + str(new_value)
		BreadFlour = new_value
	get:
		return BreadFlour

var FlowerBread: int = 0:
	set(new_value):
		flower_bread_text.text = "Flower Bread: " + str(new_value)
		FlowerBread = new_value
	get:
		return FlowerBread

@onready var bread_flower_text = $"CanvasLayer/Control/VBoxContainer/Bread Flower Text"
@onready var bread_flour_text = $"CanvasLayer/Control/VBoxContainer/Bread Flour Text"
@onready var flower_bread_text = $"CanvasLayer/Control/VBoxContainer/Flower Bread Text"

@onready var bread_flower_progress = $"CanvasLayer/Control/VBoxContainer2/Bread Flower Progress"
@onready var bread_flour_progress = $"CanvasLayer/Control/VBoxContainer3/Bread Flour Progress"
@onready var flower_bread_progress = $"CanvasLayer/Control/VBoxContainer4/Flower Bread Progress"

@onready var bread_flower_timer = $"CanvasLayer/Control/VBoxContainer2/Bread Flower Timer"

# Called when the node enters the scene tree for the first time.
func _ready():
	bread_flower_progress.max_value = bread_flower_timer.wait_time
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	bread_flower_progress.value = bread_flower_timer.time_left
	pass


func _on_bread_flower_button_button_down():
	BreadFlower += 1

func _on_bread_flour_button_button_down():
	if (BreadFlower <= 0): return
	
	BreadFlower -= 1
	BreadFlour += 1

func _on_flower_bread_button_button_down():
	if (BreadFlour <= 0): return
	BreadFlour -= 1
	FlowerBread += 1
