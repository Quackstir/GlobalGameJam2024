class_name HUD
extends Control

@onready var amount_label: Label = $"CanvasLayer/Panel/HBoxContainer/Amount Label"

var plant_1 = load("res://icon.svg")
var is_Plant: bool = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	GameManagerScript._gameManager.moneyChanged.connect(updateMoney)
	
func updateMoney(newValue) -> void:
	amount_label.text = str(newValue)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_plant_1_button_toggled(toggled_on: bool) -> void:
			Input.set_custom_mouse_cursor(plant_1)

func _on_pause_button_pressed() -> void:
	print_debug("PAUSE MENU GOES HERE")


func _on_option_button_item_selected(index: int) -> void:
	match index:
		0:
			print("Plains")
			get_tree().change_scene_to_file("res://Levels/Level_Plains.tscn")
			GameManagerScript._gameManager.MusicManager_Instance.tracks = 0
		1:
			print("Desert")
			get_tree().change_scene_to_file("res://Levels/Level_Desert.tscn")
			GameManagerScript._gameManager.MusicManager_Instance.tracks = 1
		2:
			print("Swamp")
			get_tree().change_scene_to_file("res://Levels/Level_Swamp.tscn")
			GameManagerScript._gameManager.MusicManager_Instance.tracks = 2
		3:
			print("Aquatic")
			get_tree().change_scene_to_file("res://Levels/Level_Aquatic.tscn")
			GameManagerScript._gameManager.MusicManager_Instance.tracks = 3
