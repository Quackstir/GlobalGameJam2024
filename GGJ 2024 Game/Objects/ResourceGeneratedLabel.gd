extends Label

var speed =2
@export var willMove = true

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _physics_process(delta):
	if !willMove: return
	
	global_position = global_position.move_toward(Vector2(global_position.x, global_position.y - 10), speed)
	speed -= 2*delta
	modulate.a -= 1*delta
	if modulate.a <= 0: queue_free()
