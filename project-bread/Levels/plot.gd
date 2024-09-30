class_name Plot extends Sprite2D

@onready var plot: Sprite2D = $"."
@export var PlantObject:PackedScene
var currentPlant:Plant


func _on_button_pressed() -> void:
	if GameManagerScript.currentInteraction != null:
		GameManagerScript.currentInteraction.interactionFunction(self)

func _on_button_focus_entered() -> void:
	GameManagerScript.currentPlot = self
	plot.self_modulate = Color.YELLOW

func _on_button_focus_exited() -> void:
	plot.self_modulate = Color.WHITE

func _on_button_mouse_entered() -> void:
	_on_button_focus_entered()


func _on_button_mouse_exited() -> void:
	_on_button_focus_exited()
