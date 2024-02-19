extends Button

# Sound effects for button(s)
@onready var button_hover = $ButtonHover
@onready var button_click = $ButtonClick

# Makes the button activate when pressed/clicked
func _on_pressed():
	button_click.play()
	await get_tree().create_timer(.1).timeout
	# Add button action here

# Plays UI/button hover noise
func _on_mouse_entered():
	button_hover.play()
