class_name ResourceLabel
extends Label

var speed =2
@export var willMove = true

var gameplayResource:GameplayResource

func setGameplayResource(newResource:GameplayResource):
	gameplayResource = newResource
	gameplayResource.ResourceChanged.connect(_updateLabel)
	
func _updateLabel(newValue:int):
	text = gameplayResource.name + ": " + str(newValue)
	

func _physics_process(delta):
	if !willMove: return
	
	global_position = global_position.move_toward(Vector2(global_position.x, global_position.y - 10), speed)
	speed -= 2*delta
	modulate.a -= 1*delta
	if modulate.a <= 0: queue_free()
