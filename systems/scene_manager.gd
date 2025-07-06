extends Node

var menu_scene = preload("res://components/ui/start_menu.tscn")
var upgrade_scene = preload("res://components/ui/upgrade_menu.tscn")
var play_scene = preload("res://components/gameplay/gameplay.tscn")
var pause_scene = preload("res://components/ui/pause_menu.tscn")
var pause_scene_node

func _ready() -> void:
	StateManager.changed_state.connect(handle_state_change)

func _resume_game():
	if pause_scene_node:
		get_tree().current_scene.remove_child(pause_scene_node)
		pause_scene_node.queue_free()
		pause_scene_node = null
	get_tree().paused = false

func handle_state_change(old_state: StateManager.state, new_state: StateManager.state):
	match new_state:
		StateManager.state.QUIT:
			get_tree().quit()
		StateManager.state.MENU:
			if old_state == StateManager.state.PAUSE:
				_resume_game()
			get_tree().change_scene_to_packed(menu_scene)
		StateManager.state.UPGRADE:
			get_tree().change_scene_to_packed(upgrade_scene)
		StateManager.state.PLAY:
			get_tree().change_scene_to_packed(play_scene)
		StateManager.state.PAUSE:
			pause_scene_node = pause_scene.instantiate()
			get_tree().current_scene.add_child(pause_scene_node)
			get_tree().paused = true
		StateManager.state.RESUME:
			_resume_game()
		StateManager.state.GAMEOVER:
			PlayerData.reset_all_current_stats()
			get_tree().change_scene_to_packed(menu_scene)
		_:
			pass
			
