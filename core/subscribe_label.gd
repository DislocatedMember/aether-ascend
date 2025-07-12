extends Label

func _ready() -> void:
	text = "Glimpses: %d" % PlayerData.get_currency()
	PlayerData.currency_changed.connect(update_label)

func update_label(value: int):
	text = "Glimpses: %d" % value
