class_name InteractionContainer extends VBoxContainer

@onready var interaction_button: Button = %InteractionButton
@onready var interaction_text_label: RichTextLabel = %InteractionTextLabel

@export var interaction:r_Interaction
		
func _ready() -> void:
	setInteraction(interaction)

func setInteraction(newValue):
	interaction_button.icon = newValue.interactionTexture
	interaction_text_label.text = newValue.Name

func _on_interaction_button_button_down() -> void:
	#interaction.interactionFunction()
	Input.set_custom_mouse_cursor(interaction.interactionTexture)
	GameManagerScript.currentInteraction = interaction
#func _on_plant_1_button_toggled(toggled_on: bool) -> void:
	#Input.set_custom_mouse_cursor(plant_1)
