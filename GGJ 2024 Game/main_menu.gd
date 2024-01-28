extends Node2D

func _on_credits_button_pressed():
	get_tree().change_scene_to_file("res://Credits.tscn")

func _on_play_button_pressed():
	get_tree().change_scene_to_file("res://game.tscn")

func _on_settings_button_pressed():
	get_tree().change_scene_to_file("res://Settings.tscn")

func _on_quit_button_pressed():
	get_tree().change_scene_to_file("res://Quit Confirm.tscn")
