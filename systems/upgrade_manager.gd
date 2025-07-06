extends Node

enum Stat {
	JUMP_HEIGHT,
	STAMINA
}

enum Operation{
	SUBTRACT,
	MULTIPLY,
	ADD
}

var stat_data: StatData

var current_stamina = 0


func get_stat(statName: String):
	match statName:
		"stamina_depletion_time_idle": return stat_data.stamina_depletion_time_idle
		"stamina_depletion_time_air": return stat_data.stamina_depletion_time_air
		"jump_height": return stat_data.jump_height
		"jump_count": return stat_data.jump_count
		"stamina_rate_idle": return stat_data.stamina_rate_idle
		"stamina_rate_air" : return stat_data.stamina_rate_air
		"stamina": return stat_data.stamina
	
func _ready() -> void:
	stat_data = load("res://core/default_stats.tres")
	current_stamina = stat_data.stamina
	
func reset_all_current_stats():
	current_stamina = stat_data.stamina
	
func change_current_stat(stat: Stat, operation: Operation, change_amount: float):
	if stat == Stat.STAMINA:
		if operation == Operation.SUBTRACT:
			current_stamina -= change_amount
			return current_stamina
		
func change_stat(stat: Stat, value: float):
	match stat:
		UpgradeManager.Stat.JUMP_HEIGHT: stat_data.jump_height = value
		
