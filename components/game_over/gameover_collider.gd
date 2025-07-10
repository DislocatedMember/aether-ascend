extends Node


func _on_body_entered(body: Node2D) -> void:
	if body.name == "character_dummy":
		StateManager.set_state("gameover")
