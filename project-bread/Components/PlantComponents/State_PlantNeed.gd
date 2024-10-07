extends State
class_name State_PlantNeed

@onready var plant: Plant = $"../.."
@onready var rich_text_label: RichTextLabel = $"../../RichTextLabel"

func Enter() -> void:
	rich_text_label.text = "Growing"

func Physics_Update(_delta: float) -> void:
	if (plant.isWatered):
		Transitioned.emit(self, "State_PlantGrowing")
