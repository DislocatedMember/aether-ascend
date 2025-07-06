extends Node

@export var stat_name: String
var stat_name_label: Label
var value_label: Label
var upgrade_button: Button


func _ready() -> void:
	value_label = get_child(1)
	update_value(stat_name, PlayerData.get_stat(stat_name))
	PlayerData.player_stat_changed.connect(update_value)	

func _on_upgrade_pressed() -> void:
	UpgradeManager.modify_stat(stat_name, 1.1, PlayerData.Operation.MULTIPLY)
	value_label.text = "%-10.0f" % [UpgradeManager.get_stat(stat_name)]

func update_value(stat_name: String, value: Variant):
	if stat_name == self.stat_name:
		value_label.text = "%-10.0f" % [value]
