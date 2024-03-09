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

@onready var bread_0001 = $Bread0001
@onready var bread_0002 = $Bread0002

#const WIN_SCENE = preload("res://win_scene.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	if I_gameManager == null:
		I_gameManager = self
	else:
		queue_free()
	
	bread_0001.visible = false
	bread_0002.visible = false
	
func add_resource(newResource:GameplayResource):
	gameResource.append(newResource)
	var resourcelabel:ResourceLabel = ResourceLabelScene.instantiate()
	resource_label_container.add_child(resourcelabel)
	resourcelabel.willMove = false
	resourcelabel.text = newResource.name + ": 0"
	resourcelabel.setGameplayResource(newResource)

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
	#if FlowerBread > 25:
		#get_tree().change_scene_to_file("res://win_scene.tscn")

#func _on_bread_flower_button_button_down():
##	bread_flower_button.disabled = true
	##bread_flower_timer.start()
	#BreadFlower += 1
	#button_click.play()
#
#func _on_bread_flour_button_button_down():
	#if (BreadFlower < FlowerToBreadFlour): return
	#BreadFlower -= FlowerToBreadFlour
	#
	#button_click.play()
	#BreadFlour += 1
#
#func _on_flower_bread_button_button_down():
	#if (BreadFlour < FlourToFlowerBread): return
	#BreadFlour -= FlourToFlowerBread
	#button_click.play()
	#FlowerBread += 1

