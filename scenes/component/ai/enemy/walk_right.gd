extends State


func physics_process(host: Node, delta: float) -> String:
	movement(delta)
	
	var enemy := host as Enemy
	if enemy.right_ray_cast.is_colliding() or not enemy.down_right_ray_cast.is_colliding():
		return "WalkLeft"
	return ""


func movement(delta: float) -> void:
	owner.velocity_component.accelerate_right(owner.ground_x_acceleration*delta, owner.max_x_speed)
