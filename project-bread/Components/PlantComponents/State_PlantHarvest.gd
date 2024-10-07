extends State
class_name State_PlantHarvest

@onready var plant: Plant = $"../.."

func Enter() -> void:
	plant.rich_text_label.text = "Growing"
