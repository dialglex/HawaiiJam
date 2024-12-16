extends State


func physics_process(host: Node, delta: float) -> String:
	movement(host, delta)
	
	if not host.is_on_floor():
		return "CoyoteFall"
	if Input.is_action_just_pressed("jump"):
		return "Jump"
	if Input.get_axis("move_left", "move_right"):
		return "Walk"
	return ""


func movement(_host: Node, delta: float) -> void:
	owner.velocity_component.decelerate_x(owner.ground_x_deceleration*delta)
