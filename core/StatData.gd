class_name StatData
extends Resource

signal stat_changed

@export var stats: Array[Stat]


func get_stat_names() -> Array[String]:
	var stat_names: Array[String]
	for stat in stats:
		stat_names.append(stat.stat_name)
	return stat_names

func find_stat(stat_name: String) -> Stat:
	for s in stats:
		if s.stat_name == stat_name:
			return s
	push_error("There is no skill with name: %s" % stat_name)
	return null
			
func set_stat(stat_name, value):
	set(stat_name, value)
	stat_changed.emit()

func get_stat(stat_name: String) -> float:
	return find_stat(stat_name).base_value
	
func get_upgrade_info(stat_name: String) -> Array[UpgradeInfo]:
	return find_stat(stat_name).upgrade_tiers
