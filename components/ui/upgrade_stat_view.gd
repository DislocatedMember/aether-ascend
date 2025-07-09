class_name stat_view
extends Node

@export var stat_name: String
@export var stat_name_label: Label
@export var value_label: Label
@export var cost_label: Label
@export var upgrade_button: Button
var operation: PlayerData.Operation

func _ready() -> void:
	update_value(stat_name, PlayerData.get_stat(stat_name))
	cost_label.text = str(PlayerData.get_upgrade_cost(stat_name))
	stat_name_label.text = stat_name.capitalize()
	PlayerData.player_stat_changed.connect(update_value)	

func _on_upgrade_pressed() -> void:
	PlayerData.modify_stat(stat_name, PlayerData.get_upgrade_stat_multiplier(stat_name), operation)
	value_label.text = "%.1f" % [PlayerData.get_stat(stat_name)]

func update_value(stat_name: String, value: Variant):
	if stat_name == self.stat_name:
		value_label.text = "%.1f" % [value]

	
