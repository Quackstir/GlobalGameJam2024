extends Node2D

@onready var button_hover = $ButtonHover
@onready var button_click = $ButtonClick
@onready var settings = $"CanvasLayer/Main Menu Panel/Settings"
@onready var credits = $"CanvasLayer/Main Menu Panel/Credits"
@onready var quit_confirm = $"CanvasLayer/Main Menu Panel/QuitConfirm"

@export var Main: PackedScene

func _on_credits_button_pressed():
	button_click.play()
	await get_tree().create_timer(.1).timeout
	credits.visible = true

func _on_play_button_pressed():
	button_click.play()
	await get_tree().create_timer(.1).timeout
	get_tree().change_scene_to_file("res://Scenes/game.tscn")

func _on_settings_button_pressed():
	button_click.play()
	await get_tree().create_timer(.1).timeout
	settings.visible = true

func _on_quit_button_pressed():
	button_click.play()
	await get_tree().create_timer(.1).timeout
	quit_confirm.visible = true

func _on_play_button_mouse_entered():
	button_hover.play()

func _on_settings_button_mouse_entered():
	button_hover.play()

func _on_credits_button_mouse_entered():
	button_hover.play()

func _on_quit_button_mouse_entered():
	button_hover.play()
