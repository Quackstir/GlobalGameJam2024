extends Control

var plant_1 = load("res://icon.svg")
var is_Plant: bool = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_plant_1_button_toggled(toggled_on: bool) -> void:
			Input.set_custom_mouse_cursor(plant_1)
		
		
	


func _on_pause_button_pressed() -> void:
	print_debug("PAUSE MENU GOES HERE")