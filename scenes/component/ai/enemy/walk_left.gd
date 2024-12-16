extends State


func physics_process(host: Node, delta: float) -> String:
	movement(delta)
	
	var enemy := host as Enemy
	if not enemy.left_ray_cast.is_colliding():
		return "WalkRight"
	return ""


func movement(delta: float) -> void:
	owner.velocity_component.accelerate_left(owner.ground_x_acceleration*delta, owner.max_x_speed)
