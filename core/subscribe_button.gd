extends Button

func _ready() -> void:
	UiManager.subscribe_button(self)
