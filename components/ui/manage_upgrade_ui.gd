extends Node

@export var stat_name: String
var stat_name_label: Label
var value_label: Label
var upgrade_button: Button


func _ready() -> void:
	value_label = get_child(1)
	value_label.text = "%-5.0f" % [UpgradeManager.get_stat(stat_name)]

func _on_upgrade_pressed() -> void:
	UpgradeManager.change_stat(UpgradeManager.Stat.JUMP_HEIGHT, 500)
	value_label.text = "%-5.0f" % [UpgradeManager.get_stat(stat_name)]
