class_name r_PlantInteraction extends r_Interaction

@export var plantToInteract:r_Plant

func interactionFunction(plot:Plot):
	print("Planting Plant")
	var PlantObject = plantToInteract.plantObject.instantiate()
	plot.add_child(PlantObject)
	plot.currentPlant = PlantObject as Plant 
