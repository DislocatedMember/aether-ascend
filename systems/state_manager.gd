extends Node

var current_state = state.MENU
var old_state: state
signal changed_state(old_state:state, new_state: state)


enum state {
	MENU,
	GAMEOVER,
	UPGRADE,
	PAUSE,
	PLAY,
	QUIT,
	RESUME,
}


func _ready() -> void:
	if current_state != state.MENU:
		current_state = state.MENU
	UiManager.button_clicked.connect(set_state)

func get_state(state_name: String):
	return state.get(state_name.to_upper())

		
func set_state(button_name: String):
	old_state = current_state
	current_state = get_state(button_name)
	changed_state.emit(old_state, current_state)
	
