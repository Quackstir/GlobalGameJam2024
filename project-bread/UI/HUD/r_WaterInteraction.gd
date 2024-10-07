class_name rInteract_Water extends r_Interaction

func interactionFunction(plot:Plot):
	if plot.currentPlant != null:
		plot.currentPlant.isWatered = true
