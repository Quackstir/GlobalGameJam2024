extends Node2D

@onready var sprite_2d = $Sprite2D
@export var Droppable:Texture2D
@export var Modly:Texture2D
@export var Droppedable_Dropped:Texture2D
@export var Moldy_Dropped:Texture2D
var canDrop:bool = false
@onready var press_button = $PressButton
@onready var refresh = $Refresh

@onready var jump_scare_sfx = $JumpScareSFX

func _on_button_button_down():
	if (canDrop):
		GameManager.I_gameManager.breadFlour += 1
		canDrop = false
		sprite_2d.texture = Droppedable_Dropped
	else:
		#GameManager.I_gameManager.breadFlour -= 1
		sprite_2d.texture = Moldy_Dropped
		jump_scare_sfx.play()

func _on_timer_timeout():
		canDrop = false
		sprite_2d.texture = null
		refresh.start()

func determine_drop():
	if randf_range(0,1) < 0.3:
		sprite_2d.texture = Modly
		canDrop = false
	else:
		sprite_2d.texture = Droppable
		canDrop = true

func _on_refresh_timeout():
	press_button.start()
	determine_drop()
