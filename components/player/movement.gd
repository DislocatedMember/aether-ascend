extends RigidBody2D

@export var line_renderer: Line2D
@export var stamina_bar_local: stamina_bar

var max_jumps: int = 0
var stamina_depletion_timer_idle: custom_timer
var stamina_depletion_timer_air: custom_timer


func _ready() -> void:
	line_renderer = get_child(0)
	line_renderer.add_point(Vector2.ZERO)
	line_renderer.add_point(Vector2.ZERO)	
	stamina_depletion_timer_idle = TimerManager.create_timer(UpgradeManager.get_stat("stamina_depletion_time_idle"))
	stamina_depletion_timer_air = TimerManager.create_timer(UpgradeManager.get_stat("stamina_depletion_time_air"))
	add_child(stamina_depletion_timer_idle)
	add_child(stamina_depletion_timer_air)
	max_jumps = 0
	
func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.is_pressed():
		if event.button_index ==  MOUSE_BUTTON_LEFT:
			if max_jumps < UpgradeManager.get_stat("max_jumps"):
				var mouse_pos = get_local_mouse_position()
				var direction = mouse_pos
				apply_force(direction.normalized()*UpgradeManager.get_stat("jump_height") * 100)
				max_jumps += 1
				
			
			
func _physics_process(delta: float) -> void:
	var mouse_pos = get_local_mouse_position()
	line_renderer.set_point_position(0, mouse_pos)
	
func _process(delta: float) -> void:
	if linear_velocity != Vector2.ZERO:
		stamina_bar_local.stop_deplete()
		stamina_depletion_timer_idle.reset()
		stamina_depletion_timer_air.start()
	else:
		stamina_bar_local.stop_deplete()
		stamina_depletion_timer_idle.start()
		stamina_depletion_timer_air.reset()
	if stamina_depletion_timer_idle.finished:
		stamina_bar_local.deplete(UpgradeManager.get_stat("stamina_rate_idle"))
	if stamina_depletion_timer_air.finished:
		stamina_bar_local.deplete(UpgradeManager.get_stat("stamina_rate_air"))
		
	




func _on_body_entered(body: Node2D) -> void:
	var body_pos_y = body.position.y
	if body_pos_y > position.y:
		max_jumps = 0




	
