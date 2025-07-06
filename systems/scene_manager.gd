extends Node

var menu_scene = preload("res://components/ui/start_menu.tscn")
var upgrade_scene = preload("res://components/ui/upgrade_menu.tscn")
var play_scene = preload("res://components/gameplay/gameplay.tscn")
var pause_scene = preload("res://components/ui/pause_menu.tscn")
var pause_scene_node = pause_scene.instantiate()
func _ready() -> void:
	StateManager.changed_state.connect(handle_state_change)
	
func get_all_scenes() -> Array[PackedScene]:
	var scenes: Array[PackedScene] = []
	scenes.append(menu_scene)
	scenes.append(upgrade_scene)
	scenes.append(play_scene)
	scenes.append(pause_scene)
	return scenes

func handle_state_change(old_state: StateManager.state, new_state: StateManager.state):
	match new_state:
		StateManager.state.QUIT:
			get_tree().quit()
		StateManager.state.MENU:
			if old_state == StateManager.state.PAUSE:
				get_tree().current_scene.remove_child(pause_scene_node)
				get_tree().paused = false
			get_tree().change_scene_to_packed(menu_scene)
		StateManager.state.UPGRADE:
			get_tree().change_scene_to_packed(upgrade_scene)
		StateManager.state.PLAYING:
			get_tree().change_scene_to_packed(play_scene)
		StateManager.state.PAUSE:
			get_tree().current_scene.add_child(pause_scene_node)
			get_tree().paused = true
		StateManager.state.RESUME:
			get_tree().current_scene.remove_child(pause_scene_node)
			get_tree().paused = false
		StateManager.state.GAMEOVER:
			UpgradeManager.reset_all_current_stats()
			handle_state_change(StateManager.state.GAMEOVER, StateManager.state.MENU)
		_:
			pass
			
