extends StateMachine


@export var velocity_component: VelocityComponent
@export var ground_x_acceleration: int
@export var air_x_acceleration: int
@export var ground_x_deceleration: int
@export var air_x_deceleration: int
@export var max_x_speed: int
@export var gravity_acceleration: int
@export var max_y_speed: int


func _physics_process(delta: float) -> void:
	physics_process(owner, delta)
	velocity_component.move()
