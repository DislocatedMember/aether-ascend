extends RigidBody2D

@export var line_renderer: Line2D
@export var rigidbody:  RigidBody2D

var jump_count: int = 0

func _ready() -> void:
	line_renderer = get_child(0)
	line_renderer.add_point(Vector2.ZERO)
	line_renderer.add_point(Vector2.ZERO)	
	
func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.is_pressed():
		if event.button_index ==  MOUSE_BUTTON_LEFT:
			if jump_count < 2:
				var mouse_pos = get_local_mouse_position()
				var direction = mouse_pos
				apply_force(direction*100)
				jump_count += 1
			
			
func _physics_process(delta: float) -> void:
	var mouse_pos = get_local_mouse_position()
	line_renderer.set_point_position(0, mouse_pos)






func _on_body_entered(body: Node2D) -> void:
	var body_pos_y = body.position.y
	if body_pos_y > position.y:
		jump_count = 0
	
