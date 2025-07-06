extends Node

signal button_clicked(value: String)

@export var buttons: Array[Button] = []


				
				
					
func subscribe(button: Button):
	if button.pressed.is_connected(_on_button_pressed): return
	button.pressed.connect(_on_button_pressed.bind(button))
	
func _on_button_pressed(button: Button):
	button_clicked.emit(button.name)
