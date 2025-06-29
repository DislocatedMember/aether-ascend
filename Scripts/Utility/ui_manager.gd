extends Node

signal button_clicked(value: String)

@export var buttons: Array[Button] = []

func _ready() -> void:
	SceneManager.scene_ready.connect(get_all_buttons_in_scene)
	for button in get_tree().get_first_node_in_group("button_container").get_children():
		button.pressed.connect(_on_button_pressed.bind(button))
		
func get_all_buttons_in_scene():
	for button in get_tree().get_first_node_in_group("button_container").get_children():
		button.pressed.connect(_on_button_pressed.bind(button))
		
	
func _on_button_pressed(button: Button):
	var button_name = button.text
	button_clicked.emit(button_name)
