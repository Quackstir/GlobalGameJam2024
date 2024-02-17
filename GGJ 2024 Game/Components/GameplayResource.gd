class_name GameplayResource

signal ResourceChanged
var ResourceValue: int = 0:
	set(new_value):
		emit_signal("ResourceChanged")
		
		#bread_flower_text.text = "Bread Flower: " + str(new_value)
		
		#if (new_value > 0):
			#bread_0001.visible = true
		
		ResourceValue = new_value
	get:
		return ResourceValue
