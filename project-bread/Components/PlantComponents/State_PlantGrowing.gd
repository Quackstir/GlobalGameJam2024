extends State
class_name State_PlantGrowing

@onready var plant: Plant = $"../.."

func Enter() -> void:
	plant.rich_text_label.text = "Growing"
	plant.sprite_2d.texture = plant.Stages[plant.currentStage].Sprite
	plant.timer.wait_time = plant.Stages[plant.currentStage].TimeToGrow
	plant.EndStageReward = plant.Stages[plant.currentStage].RewardMoney
	plant.timer.start()

func _on_timer_timeout() -> void:
	if plant.currentStage + 1 < plant.Stages.size():
		Transitioned.emit(self, "State_PlantNeed")
	else:
		Transitioned.emit(self, "State_PlantHarvest")

func Exit() -> void:
	plant.currentStage += 1
	GameManagerScript._gameManager.money += plant.EndStageReward
