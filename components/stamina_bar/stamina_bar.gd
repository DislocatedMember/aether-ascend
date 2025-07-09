class_name stamina_bar
extends ProgressBar

@export var value_label: Label
var is_depleting = false
var current_rate = 0

func _ready() -> void:
	max_value = PlayerData.get_stat("max_stamina")
	value = max_value
	value_label.text = "%-5.1f / %5.1f" % [value, max_value]
	PlayerData.player_current_stat_changed.connect(set_label)
	
	
func set_label(stat_name: String, new_value):
	if stat_name == "current_stamina":
		value = new_value
		value_label.text = "%-5.1f / %5.1f" % [value, max_value]

func deplete(new_rate: float):
	current_rate = new_rate
	is_depleting = true

func stop_deplete():
	is_depleting = false
	current_rate = 0
	
func _process(delta: float) -> void:
	if !is_depleting: return
	PlayerData.modify_current_stat("current_stamina", current_rate*delta,PlayerData.get_operation("subtract"))
	if value == 0.0: 
		StateManager.set_state("gameover")
		
