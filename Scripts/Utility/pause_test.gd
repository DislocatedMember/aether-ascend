extends Node2D

var start: Vector2
var time: float

func _ready() -> void:
	start = position
	
func _process(delta: float) -> void:
	time += delta
	position.y = start.y + sin(time * 5) * 25
	
