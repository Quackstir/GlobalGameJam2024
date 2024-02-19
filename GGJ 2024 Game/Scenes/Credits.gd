extends Node2D
@onready var credits_panel = $".."
@onready var button_hover = $ButtonHover
@onready var button_click = $ButtonClick

@export var Credits: PackedScene

func _on_back_pressed():
	button_click.play()
	await get_tree().create_timer(.1).timeout
	credits_panel.visible = false


func _on_back_mouse_entered():
	button_hover.play()
