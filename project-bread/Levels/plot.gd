class_name Plot extends Sprite2D

@onready var plot: Sprite2D = $"."
@export var PlantObject:PackedScene
var currentPlant:Plant


func _on_button_pressed() -> void:
	print("Gamers")
	
	if currentPlant == null:
		var PlantObject = PlantObject.instantiate()
		add_child(PlantObject)
		currentPlant = PlantObject as Plant
	else:
		currentPlant.isWatered = true


func _on_button_focus_entered() -> void:
	plot.self_modulate = Color.YELLOW


func _on_button_focus_exited() -> void:
	plot.self_modulate = Color.WHITE

func _on_button_mouse_entered() -> void:
	_on_button_focus_entered()


func _on_button_mouse_exited() -> void:
	_on_button_focus_exited()
