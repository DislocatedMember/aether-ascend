extends Node

enum Operation{
	SET,
	ADD,
	SUBTRACT,
	MULTIPLY,
	DIVIDE
}


var stat_data: StatData
var current_stamina: float


signal player_stat_changed(stat_name:String, value)
signal player_current_stat_changed(stat_name:String, value)


func _ready() -> void:
	stat_data = load("res://core/default_stats.tres")
	reset_all_current_stats()

func get_operation(operation: String):
	return Operation.get(operation.to_upper())

func modify_stat(stat_name:String, value: Variant, operation: Operation = Operation.SET):
	var current_value = get_stat(stat_name)
	var new_value
	match operation:
		Operation.SET: new_value = value
		Operation.ADD: new_value = current_value + value
		Operation.SUBTRACT: new_value = current_value - value
		Operation.MULTIPLY: new_value = current_value * value
		Operation.DIVIDE:
			if value == 0: 
				printerr("Attempted to divide stat %s by zero" %[stat_name])
				return
			new_value = current_value / value
	set_stat(stat_name, new_value)
	
func modify_current_stat(stat_name:String, value: Variant, operation: Operation = Operation.SET):
	var current_value = get(stat_name)
	var new_value
	match operation:
		Operation.SET: new_value = value
		Operation.ADD: new_value = current_value + value
		Operation.SUBTRACT: new_value = current_value - value
		Operation.MULTIPLY: new_value = current_value * value
		Operation.DIVIDE:
			if value == 0: 
				printerr("Attempted to divide stat %s by zero" %[stat_name])
				return
			new_value = current_value / value
	set(stat_name, new_value)
	player_current_stat_changed.emit(stat_name, new_value)
				
func get_stat(stat_name):
	return stat_data.get_stat(stat_name)

func get_current_stat(stat_name):
	return get(stat_name)
	
func set_stat(stat_name: String, value: float):
	stat_data.set_stat(stat_name, value)
	player_stat_changed.emit(stat_name, value)
	
func reset_all_current_stats():
	current_stamina = get_stat("max_stamina")
