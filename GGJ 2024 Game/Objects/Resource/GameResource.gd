extends VBoxContainer

@onready var timer = $Timer
@onready var button = $Button
@onready var progress = $Progress

# Called when the node enters the scene tree for the first time.
func _ready():
	progress.max_value = timer.wait_time
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
