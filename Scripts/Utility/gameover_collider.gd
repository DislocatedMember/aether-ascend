extends Node


func _on_body_entered(body: Node2D) -> void:
	if body.name == "character_dummy":
		StateManager.change_state("death")
	if body.is_in_group("platforms"):
		body.queue_free()
