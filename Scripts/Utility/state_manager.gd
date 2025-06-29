extends Node

var current_state = state.MENU
var old_state: state
signal changed_state(old_state:state, new_state: state)


enum state {
	MENU,
	GAMEOVER,
	UPGRADE,
	PAUSE,
	PLAYING,
	QUIT,
	RESUME
}

var state_button_map: Dictionary = {
	"menu" : state.MENU,
	"upgrade" : state.UPGRADE,
	"play": state.PLAYING,
	"quit": state.QUIT,
	"pause": state.PAUSE,
	"resume": state.RESUME
}

func _ready() -> void:
	if current_state != state.MENU:
		current_state = state.MENU
	UiManager.button_clicked.connect(change_state)

		
func change_state(button_name: String):
	old_state = current_state
	current_state = state_button_map[button_name.to_lower()]
	changed_state.emit(old_state, current_state)
	
