extends Node

func create_timer(cooldown: float) -> custom_timer:
	var timer = custom_timer.new()
	timer.cooldown = cooldown
	timer.last_cooldown = cooldown
	return timer
