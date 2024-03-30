extends Node2D

@onready var quit_confirm = $".."
@onready var button_hover = $ButtonHover
@onready var button_click = $ButtonClick
@export var quitConfirm: PackedScene

func _on_no_exit_pressed():
	button_click.play()
	await get_tree().create_timer(.1).timeout
	quit_confirm.visible = false

func _on_yes_exit_pressed():
	button_click.play()
	await get_tree().create_timer(.1).timeout
	get_tree().quit()


func _on_no_exit_mouse_entered():
	button_hover.play()


func _on_yes_exit_mouse_entered():
	button_hover.play()
