extends Node2D

@onready var button_hover = $ButtonHover
@onready var button_click = $ButtonClick

func _on_button_pressed():
	button_click.play()
	await get_tree().create_timer(.1).timeout
	get_tree().change_scene_to_file("res://main_menu.tscn")


func _on_button_mouse_entered():
	button_hover.play()
