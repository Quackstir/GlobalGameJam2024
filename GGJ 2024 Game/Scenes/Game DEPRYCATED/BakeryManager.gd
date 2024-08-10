extends Node

@export var textures:Array[Texture]

@onready var h_box_container = $HBoxContainer

func _ready():
	resetCode()

func resetCode():
	for n in 4:
		var newTexture = TextureRect.new()
		newTexture.texture = textures[randi_range(0,3)]
		newTexture.expand_mode = TextureRect.EXPAND_FIT_WIDTH
		h_box_container.add_child(newTexture)

func _on_button_button_down():
	pass # Replace with function body.

func _on_button_2_button_down():
	pass # Replace with function body.

func _on_button_3_button_down():
	pass # Replace with function body.

func _on_button_4_button_down():
	pass # Replace with function body.
