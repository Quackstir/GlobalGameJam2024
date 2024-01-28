class_name GameManager
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
		
		
		#if new_value > BreadFlour: 
			#var valueChange = new_value - BreadFlour
			#BreadFlower -= FlowerToBreadFlour * valueChange
		
		BreadFlour = new_value
	get:
		return BreadFlour
@export var FlowerToBreadFlour: int = 3

var FlowerBread: int = 0:
	set(new_value):
		flower_bread_text.text = "Flower Bread: " + str(new_value)
		
		#if new_value > FlowerBread: 
			#var valueChange = new_value - FlowerBread
			#BreadFlour -= FlourToFlowerBread * FlowerBread
		cpu_particles_2d.emitting = new_value > 0
			
		FlowerBread = new_value
	get:
		return FlowerBread
@export var FlourToFlowerBread: int = 7

@onready var animation_player = $CanvasLayer/AnimationPlayer
@onready var cpu_particles_2d = $CanvasLayer/CPUParticles2D

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
	bread_flower_progress.max_value = bread_flower_timer.wait_time
	bread_flour_progress.max_value = bread_flour_timer.wait_time
	flower_bread_progress.max_value = flower_bread_timer.wait_time
	
	bread_flour_container.visible = false
	flower_bread_container.visible = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	bread_flower_progress.value = bread_flower_timer.time_left
	bread_flour_progress.value = bread_flour_timer.time_left
	flower_bread_progress.value = flower_bread_timer.time_left
	
	if BreadFlower >= FlowerToBreadFlour: bread_flour_container.visible = true
	if BreadFlour >= FlourToFlowerBread: flower_bread_container.visible = true
	
	if FlowerBread > 1000:
		animation_player.play("FadeGameOver")
	
	if Input.is_key_pressed(KEY_1): BreadFlower += 10
	if Input.is_key_pressed(KEY_2): BreadFlour += 10
	if Input.is_key_pressed(KEY_3): FlowerBread += 10

func _on_bread_flower_button_button_down():
	bread_flower_button.disabled = true
	bread_flower_timer.start()
	BreadFlower += 1

func _on_bread_flour_button_button_down():
	if (BreadFlower < FlowerToBreadFlour): return
	
	bread_flour_button.disabled = true
	bread_flour_timer.start()
	
	BreadFlour += 1

func _on_flower_bread_button_button_down():
	if (BreadFlour < FlourToFlowerBread): return
	flower_bread_button.disabled = true
	flower_bread_timer.start()
	FlowerBread += 1


func _on_bread_flower_timer_timeout():
	bread_flower_button.disabled = false


func _on_bread_flour_timer_timeout():
	bread_flour_button.disabled = false


func _on_flower_bread_timer_timeout():
	flower_bread_button.disabled = false
