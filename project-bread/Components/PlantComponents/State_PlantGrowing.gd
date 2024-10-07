extends State
class_name State_PlantGrowing

@onready var plant: Plant = $"../.."

func Enter() -> void:
	plant.rich_text_label.text = "Growing"
	plant.currentStage += 1
	plant.sprite_2d.texture = plant.Stages[plant.currentStage].Sprite
	plant.timer.wait_time = plant.Stages[plant.currentStage].TimeToGrow
	plant.EndStageReward = plant.Stages[plant.currentStage].RewardMoney


func _on_timer_timeout() -> void:
	if plant.currentStage < plant.Stages.size():
		Transitioned.emit(self, "State_PlantNeed")
	else:
		Transitioned.emit(self, "State_PlantHarvest")

func Exit() -> void:
	GameManagerScript.money += plant.EndStageReward
