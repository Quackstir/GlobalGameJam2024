extends Node2D

@onready var button_hover = $ButtonHover
@onready var button_click = $ButtonClick

# Called when the node enters the scene tree for the first time.
#func _ready():
	#get_node("CanvasLayer").hide()
	#pause_panel.visible = false
	
@onready var pause_panel = $"CanvasLayer/Pause Panel"
	
func _input(_event):
	if Input.is_action_just_pressed("ui_menu"):
		print("PAUSE MENU")
		if pause_panel.visible:
			button_click.play()
			await get_tree().create_timer(.1).timeout
			pause_panel.hide()
			#get_tree().paused = false
		else:
			button_click.play()
			await get_tree().create_timer(.1).timeout
			pause_panel.show()
			#get_tree().paused = true
		#pause_panel.visible != pause_panel.visible

func _on_resume_pressed():
	button_click.play()
	await get_tree().create_timer(.1).timeout
	pause_panel.hide()
	#get_tree().paused = false
	
func _on_quit_pressed():
	button_click.play()
	await get_tree().create_timer(.1).timeout
	get_tree().change_scene_to_file("res://Scenes/main_menu.tscn")

func _on_resume_mouse_entered():
	button_hover.play()

func _on_quit_mouse_entered():
	button_hover.play()
