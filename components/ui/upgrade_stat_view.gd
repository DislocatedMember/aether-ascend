class_name stat_view
extends Node

@export var stat_name_local: String
@export var stat_name_label: Label
@export var value_label: Label
@export var cost_label: Label
@export var upgrade_button: Button
@export var current_currency_label: Label
var operation: PlayerData.Operation

func _ready() -> void:
	update_value(stat_name_local, PlayerData.get_stat(stat_name_local))
	cost_label.text = str(PlayerData.get_upgrade_cost(stat_name_local))
	stat_name_label.text = stat_name_local.capitalize()
	PlayerData.player_stat_changed.connect(update_value)	

func _on_upgrade_pressed() -> void:
	var upgrade_cost = PlayerData.get_upgrade_cost(stat_name_local)
	if PlayerData.get_currency() >= upgrade_cost :
		PlayerData.decrease_currency(upgrade_cost)
		print("%s upgrade button pressed" % stat_name_local)
		PlayerData.modify_stat(stat_name_local, PlayerData.get_upgrade_stat_modifier(stat_name_local), PlayerData.get_upgrade_operation(stat_name_local))
		value_label.text = "%.1f" % [PlayerData.get_stat(stat_name_local)]

func update_value(stat_name: String, value: Variant):
	if stat_name == stat_name_local:
		value_label.text = "%.1f" % [value]

	
