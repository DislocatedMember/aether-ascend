extends Node

var timers = {}

func _ready() -> void:
	timers["stamina_depletion_cooldown_idle"] = UpgradeManager.stat_data.stamina_depletion_time_idle
	timers["stamina_depletion_cooldown_air"] = UpgradeManager.stat_data.stamina_depletion_time_air

func start_timer(timer_name: String, duration: float):
	timers[timer_name] = duration
	
func _process(delta: float) -> void:
	for timer_name in timers.keys():
		timers[timer_name] -= delta
		
