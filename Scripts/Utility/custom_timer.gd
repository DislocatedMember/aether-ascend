class_name custom_timer
extends Node


var cooldown: float
var last_cooldown: float
var running: bool = false
var finished: bool = false
var paused: bool = false


func start():
	running = true;
	
func pause():
	paused = true

func resume():
	paused = false
	
func reset():
	finished = false
	running = false
	cooldown = last_cooldown
	
func _process(delta: float) -> void:
	if running:
		if paused:
			return
		cooldown -= delta
		if cooldown <= 0.0:
			finished = true
			cooldown = last_cooldown
			
	
