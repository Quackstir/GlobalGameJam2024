extends Button

@onready var hover_sfx = $HoverSFX
@onready var click_sfx = $ClickSFX

func _on_button_down():
	click_sfx.play()

func _on_focus_entered():
	hover_sfx.play()

func _on_mouse_entered():
	hover_sfx.play()
