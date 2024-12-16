extends State


func physics_process(host: Node, delta: float) -> String:
	movement(delta)
	
	if host.is_on_floor():
		if Input.get_axis("move_left", "move_right"):
			return "Walk"
		return "Idle"
	return ""


func movement(delta: float) -> void:
	var direction := Input.get_axis("move_left", "move_right")
	if direction < 0:
		owner.velocity_component.accelerate_left(owner.air_x_acceleration*delta, owner.max_x_speed)
	elif direction > 0:
		owner.velocity_component.accelerate_right(owner.air_x_acceleration*delta, owner.max_x_speed)
	else:
		owner.velocity_component.decelerate_x(owner.air_x_deceleration*delta)

	owner.velocity_component.accelerate_down(owner.gravity_acceleration*delta, owner.max_y_speed)
