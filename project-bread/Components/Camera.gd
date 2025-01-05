extends Camera2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	GameManagerScript._gameManager.HUD_Instance.CameraPosition.connect(changeCameraPosition)

func changeCameraPosition(NewPosition:Vector2):
	position = Vector2(NewPosition)
