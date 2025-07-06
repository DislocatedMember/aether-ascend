extends Node2D

var new_position
var move = false

@export var lerp_speed: float = 2
@export var move_factor = 0.5
@export var border: Node2D
@export var player: RigidBody2D
var platforms: Array[Node]

var current_position: Vector2

func _ready() -> void:
	current_position = position
	

func find_lowest_platform() -> Node2D:
	platforms = get_tree().get_nodes_in_group("platforms")
	var current_lowest_y = null
	var current_lowest_platform = platforms[0]
	for platform in platforms:
		var opt = platform.position.y
		if current_lowest_y == null  or opt > current_lowest_y:
			current_lowest_y = opt
			current_lowest_platform = platform
	return current_lowest_platform
			
		
func _process(delta: float) -> void:
	if !move:
		if player.global_position.y < border.global_position.y:
			new_position = position + Vector2.UP * (get_window().size.y * move_factor)
			move = true
	if move:
		position.y = move_toward(position.y, new_position.y, delta*lerp_speed)
		if abs(position.y - new_position.y) < 0.1:
			move = false
		
	

		
