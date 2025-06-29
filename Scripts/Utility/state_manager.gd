extends Node

var current_state = state.MENU
signal changed_state(new_state: state)


enum state {
	MENU,
	GAMEOVER,
	UPGRADE,
	PAUSE,
	PLAYING,
	QUIT
}

var state_button_map: Dictionary = {
	"menu" : state.MENU,
	"upgrade" : state.UPGRADE,
	"play": state.PLAYING,
	"quit": state.QUIT
}

func _ready() -> void:
	if current_state != state.MENU:
		current_state = state.MENU
	UiManager.button_clicked.connect(change_state)

		
func change_state(button_name: String):
	current_state = state_button_map[button_name.to_lower()]
	changed_state.emit(current_state)
	
