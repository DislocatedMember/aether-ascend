class_name stamina_bar
extends ProgressBar

@export var value_label: Label
var is_depleting = false
var current_rate = 0

func _ready():
	max_value = UpgradeManager.get_stat("stamina")
	value = max_value
	set_label()

func toggle_is_depleting():
	is_depleting = !is_depleting
	
func set_label():
	value_label.text = "%-5.1f / %5.1f" % [value, max_value]

func deplete(new_rate: float):
	current_rate = new_rate
	is_depleting = true

func stop_deplete():
	is_depleting = false
	current_rate = 0
	
func _physics_process(delta: float) -> void:
	if !is_depleting: return
	value = UpgradeManager.change_current_stat(UpgradeManager.Stat.STAMINA, UpgradeManager.Operation.SUBTRACT, current_rate * delta)
	set_label()
	if value == 0.0: 
		StateManager.change_state("stamina_depleted")
		
