extends VBoxContainer

@onready var plant_texture = $"Plot Texture/Plant Texture"
@onready var timer = $Timer
@onready var button = $Button

func _on_button_button_down():
	GameManager.I_gameManager.flowerBread += 1
	timer.start()
	button.disabled = true

func _on_timer_timeout():
	button.disabled = false

func _physics_process(delta):
	plant_texture.size.y = (100 * (timer.wait_time - timer.time_left)/timer.wait_time)
