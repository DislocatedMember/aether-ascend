extends Node

signal button_clicked(value: String)

@export var buttons: Array[Button] = []

func _ready() -> void:
	get_all_buttons_in_scene()
		
func get_all_buttons_in_scene():
	var containers = get_tree().get_nodes_in_group("button_container")
	if containers:
		for container in containers:
			for button in container.get_children():
				if button.pressed.is_connected(_on_button_pressed): continue
				button.pressed.connect(_on_button_pressed.bind(button))
				
					
		
	
func _on_button_pressed(button: Button):
	button_clicked.emit(button.name)
