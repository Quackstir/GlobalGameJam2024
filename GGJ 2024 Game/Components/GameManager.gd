class_name GameManager extends Node2D

static var I_gameManager:GameManager

#make a dictionary
var gameResource:Array[GameplayResource] = []

@export var ResourceLabelScene:PackedScene
@onready var resource_label_container = %"Resource Label Container"

@onready var animation_player = $CanvasLayer/AnimationPlayer
@onready var cpu_particles_2d = $CanvasLayer/CPUParticles2D
@onready var button_click = $ButtonClick
@onready var button_hover = $ButtonHover


#const WIN_SCENE = preload("res://win_scene.tscn")

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

