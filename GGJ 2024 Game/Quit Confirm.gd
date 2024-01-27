extends Node2D

func _on_no_exit_pressed():
	get_tree().change_scene_to_file("res://main_menu.tscn")

func _on_yes_exit_pressed():
	get_tree().quit()
