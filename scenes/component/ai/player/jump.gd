extends State


@onready var timer := $Timer


func enter() -> void:
	timer.start()


func exit() -> void:
	timer.stop()


func physics_process(host: Node, delta: float) -> String:
	movement(delta)

	if not Input.is_action_pressed("jump") or timer.is_stopped() or host.is_on_ceiling():
		return "Fall"
	return ""

func movement(delta: float) -> void:
	var direction := Input.get_axis("move_left", "move_right")
	if direction < 0:
		owner.velocity_component.accelerate_left(owner.air_x_acceleration*delta, owner.max_x_speed)
	elif direction > 0:
		owner.velocity_component.accelerate_right(owner.air_x_acceleration*delta, owner.max_x_speed)
	else:
		owner.velocity_component.decelerate_x(owner.air_x_deceleration*delta)

	owner.velocity_component.velocity.y = -owner.jump_speed
	if not Input.is_action_pressed("jump"):
		owner.velocity_component.velocity.y = owner.velocity_component.velocity.y*0.75
