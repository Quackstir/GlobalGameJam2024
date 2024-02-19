extends Node2D
@onready var settings_panel = $".."
@onready var button_hover = $ButtonHover
@onready var button_click = $ButtonClick
@export var Settings: PackedScene

func _on_back_pressed():
	button_click.play()
	await get_tree().create_timer(.1).timeout
	settings_panel.visible = false

func _on_back_mouse_entered():
	button_hover.play()
