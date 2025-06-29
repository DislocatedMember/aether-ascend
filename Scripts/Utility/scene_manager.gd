extends Node

signal scene_ready


func _ready() -> void:
	StateManager.changed_state.connect(handle_state_change)
	
func handle_state_change(new_state: StateManager.state):
	if new_state == StateManager.state.QUIT:
		get_tree().quit()
	
	
