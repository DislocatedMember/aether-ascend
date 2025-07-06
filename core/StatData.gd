class_name StatData
extends Resource

signal stat_changed

@export var currency: int # upgrade currency
@export var jump_height: float
@export var max_jumps: int
@export var max_stamina: float
@export var stamina_rate_idle: float
@export var stamina_depletion_time_idle: float
@export var stamina_depletion_time_air: float
@export var stamina_rate_air: float

func get_stat(stat_name):
	return get(stat_name)
	
func set_stat(stat_name, value):
	set(stat_name, value)
	stat_changed.emit()
