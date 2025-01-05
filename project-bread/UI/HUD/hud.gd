class_name HUD
extends Control

@onready var amount_label: Label = $"CanvasLayer/Panel/HBoxContainer/Amount Label"

var plant_1 = load("res://icon.svg")
var is_Plant: bool = false

var Current_Scene = null

signal CameraPosition(Vector2)

@onready var credits: Panel = $CanvasLayer/Credits

@onready var interaction_container: InteractionContainer = $CanvasLayer/Panel2/MarginContainer/HBoxContainer/InteractionContainer
@onready var interaction_container_3: InteractionContainer = $CanvasLayer/Panel2/MarginContainer/HBoxContainer/InteractionContainer3
@onready var interaction_container_4: InteractionContainer = $CanvasLayer/Panel2/MarginContainer/HBoxContainer/InteractionContainer4
@onready var interaction_container_5: InteractionContainer = $CanvasLayer/Panel2/MarginContainer/HBoxContainer/InteractionContainer5
@onready var interaction_container_6: InteractionContainer = $CanvasLayer/Panel2/MarginContainer/HBoxContainer/InteractionContainer6
@onready var interaction_container_7: InteractionContainer = $CanvasLayer/Panel2/MarginContainer/HBoxContainer/InteractionContainer7
@onready var interaction_container_8: InteractionContainer = $CanvasLayer/Panel2/MarginContainer/HBoxContainer/InteractionContainer8
@onready var interaction_container_9: InteractionContainer = $CanvasLayer/Panel2/MarginContainer/HBoxContainer/InteractionContainer9

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	GameManagerScript._gameManager.moneyChanged.connect(updateMoney)
	
func updateMoney(newValue) -> void:
	amount_label.text = str(newValue)

func _on_plant_1_button_toggled(toggled_on: bool) -> void:
	Input.set_custom_mouse_cursor(plant_1)

func _on_pause_button_pressed() -> void:
	credits.visible = true


func _on_option_button_item_selected(index: int) -> void:
	match index:
		0:
			print("Plains")
			emit_signal("CameraPosition",Vector2(962,542))
			GameManagerScript._gameManager.MusicManager_Instance.tracks = 0
			
			interaction_container.visible = true
			interaction_container_3.visible = true
			interaction_container_4.visible = false
			interaction_container_5.visible = false
			interaction_container_6.visible = false
			interaction_container_7.visible = false
			interaction_container_8.visible = false
			interaction_container_9.visible = false
		1:
			print("Desert")
			emit_signal("CameraPosition",Vector2(4909,246))
			GameManagerScript._gameManager.MusicManager_Instance.tracks = 1
			
			interaction_container.visible = false
			interaction_container_3.visible = false
			interaction_container_4.visible = true
			interaction_container_5.visible = true
			interaction_container_6.visible = false
			interaction_container_7.visible = false
			interaction_container_8.visible = false
			interaction_container_9.visible = false
			
		2:
			print("Swamp")
			emit_signal("CameraPosition",Vector2(7985,345))
			GameManagerScript._gameManager.MusicManager_Instance.tracks = 2
			
			interaction_container.visible = false
			interaction_container_3.visible = false
			interaction_container_4.visible = false
			interaction_container_5.visible = false
			interaction_container_6.visible = true
			interaction_container_7.visible = true
			interaction_container_8.visible = false
			interaction_container_9.visible = false
			
		3:
			print("Aquatic")
			emit_signal("CameraPosition",Vector2(10800,219))
			GameManagerScript._gameManager.MusicManager_Instance.tracks = 3
			
			interaction_container.visible = false
			interaction_container_3.visible = false
			interaction_container_4.visible = false
			interaction_container_5.visible = false
			interaction_container_6.visible = false
			interaction_container_7.visible = false
			interaction_container_8.visible = true
			interaction_container_9.visible = true

func switchScenes(SwitchToScene):
	if Current_Scene != null:
		Current_Scene.free()
	Current_Scene = SwitchToScene
	get_tree().root.add_child(Current_Scene)
	get_tree().current_scene = Current_Scene


func _on_button_button_down() -> void:
	credits.visible = false
