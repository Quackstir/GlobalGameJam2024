extends VBoxContainer

@onready var plant_texture = $"Plot Texture/Plant Texture"
@onready var timer = $Timer
@onready var button = $Button
@export var completedColor:Color
@export var progressColor:Color
@onready var progress_bar = %ProgressBar
@onready var rich_text_label = %RichTextLabel

func _ready():
	rich_text_label.text = "[center]Harvest[/center]"
	progress_bar.modulate = completedColor

func _on_button_button_down():
	GameManager.I_gameManager.flowerBread += 1
	timer.start()
	rich_text_label.text = "[center]Growing[/center]"
	button.disabled = true
	progress_bar.modulate = progressColor

func _on_timer_timeout():
	rich_text_label.text = "[center]Harvest[/center]"
	button.disabled = false
	progress_bar.modulate = completedColor

func _physics_process(delta):
	var a = (100 * (timer.wait_time - timer.time_left)/timer.wait_time)
	plant_texture.size.y = a
	progress_bar.value = a
