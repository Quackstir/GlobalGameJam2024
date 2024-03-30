class_name GameplayResource

var name:String

signal ResourceChanged(ResourceAmount:int)

var ResourceValue: int = 0:
	set(new_value):
		emit_signal("ResourceChanged",new_value)
		
		#bread_flower_text.text = "Bread Flower: " + str(new_value)
		
		#if (new_value > 0):
			#bread_0001.visible = true
		
		ResourceValue = new_value
	get:
		return ResourceValue
