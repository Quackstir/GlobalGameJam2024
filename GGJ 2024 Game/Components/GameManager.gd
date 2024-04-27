class_name GameManager extends Node2D

static var I_gameManager:GameManager

#make a dictionary
var gameResource:Array[GameplayResource] = []

var flowerBread:int = 0 : 
	set (newValue):
		flowerBread = newValue
		print ("Flower Bread: " + str(newValue))

var breadFlour:int = 0 : 
	set (newValue):
		breadFlour = newValue
		print ("Flower Bread: " + str(newValue))

@export var ResourceLabelScene:PackedScene
@onready var resource_label_container = %"Resource Label Container"

@onready var animation_player = $CanvasLayer/AnimationPlayer
@onready var cpu_particles_2d = $CanvasLayer/CPUParticles2D
@onready var button_click = $ButtonClick
@onready var button_hover = $ButtonHover


#const WIN_SCENE = preload("res://win_scene.tscn")

#Text
#region Text
@onready var bread_flower_text = $"CanvasLayer/Control/VBoxContainer/Bread Flower Text"
@onready var bread_flour_text = $"CanvasLayer/Control/VBoxContainer/Bread Flour Text"
@onready var flower_bread_text = $"CanvasLayer/Control/VBoxContainer/Flower Bread Text"
#endregion

#Progress Bars
#region Progress Bars
@onready var bread_flower_progress = $"CanvasLayer/Control/Bread Flower Container/Bread Flower Progress"
@onready var bread_flour_progress = $"CanvasLayer/Control/Bread Flour Container/Bread Flour Progress"
@onready var flower_bread_progress = $"CanvasLayer/Control/Flower Bread Container/Flower Bread Progress"
#endregion

#Timers
#region Timers
@onready var bread_flower_timer = $"CanvasLayer/Control/Bread Flower Container/Bread Flower Timer"
@onready var bread_flour_timer = $"CanvasLayer/Control/Bread Flour Container/Bread Flour Timer"
@onready var flower_bread_timer = $"CanvasLayer/Control/Flower Bread Container/Flower Bread Timer"
#endregion

#Buttons
#region Buttons
@onready var bread_flower_button = $"CanvasLayer/Control/Bread Flower Container/Bread Flower Button"
@onready var bread_flour_button = $"CanvasLayer/Control/Bread Flour Container/Bread Flour Button"
@onready var flower_bread_button = $"CanvasLayer/Control/Flower Bread Container/Flower Bread Button"
#endregion

#Containers
#region Containers
@onready var bread_flower_container = $"CanvasLayer/Control/Bread Flower Container"
@onready var bread_flour_container = $"CanvasLayer/Control/Bread Flour Container"
@onready var flower_bread_container = $"CanvasLayer/Control/Flower Bread Container"
#endregion

# Called when the node enters the scene tree for the first time.
func _ready():
	if I_gameManager == null:
		I_gameManager = self
	else:
		queue_free()

func add_resource(newResource:GameplayResource):
	gameResource.append(newResource)
	var resourcelabel:ResourceLabel = ResourceLabelScene.instantiate()
	resource_label_container.add_child(resourcelabel)
	resourcelabel.willMove = false
	resourcelabel.text = newResource.name + ": 0"
	resourcelabel.setGameplayResource(newResource)

