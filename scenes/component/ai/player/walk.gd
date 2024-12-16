extends State


func physics_process(host: Node, delta: float) -> String:
	movement(delta)
	
	if not host.is_on_floor():
		return "CoyoteFall"
	if Input.is_action_just_pressed("jump"):
		return "Jump"
	if not Input.get_axis("move_left", "move_right"):
		return "Idle"
	return ""


func movement(delta: float) -> void:
	var direction := Input.get_axis("move_left", "move_right")
	if direction < 0:
		owner.velocity_component.accelerate_left(owner.ground_x_acceleration*delta, owner.max_x_speed)
	elif direction > 0:
		owner.velocity_component.accelerate_right(owner.ground_x_acceleration*delta, owner.max_x_speed)
