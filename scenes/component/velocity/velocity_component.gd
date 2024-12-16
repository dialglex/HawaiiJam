class_name VelocityComponent
extends Node


var velocity := Vector2.ZERO


func accelerate(acceleration: float, direction: Vector2, max_speed: float) -> void:
	velocity = velocity.move_toward(max_speed*direction, acceleration)


func accelerate_left(acceleration: float, max_x_speed: float) -> void:
	velocity.x = move_toward(velocity.x, -max_x_speed, acceleration)


func accelerate_right(acceleration: float, max_x_speed: float) -> void:
	velocity.x = move_toward(velocity.x, max_x_speed, acceleration)


func accelerate_up(acceleration: float, max_y_speed: float) -> void:
	velocity.y = move_toward(velocity.y, -max_y_speed, acceleration)


func accelerate_down(acceleration: float, max_y_speed: float) -> void:
	velocity.y = move_toward(velocity.y, max_y_speed, acceleration)


func decelerate(deceleration: float) -> void:
	velocity = velocity.move_toward(Vector2.ZERO, deceleration)


func decelerate_x(deceleration: float) -> void:
	velocity.x = move_toward(velocity.x, 0, deceleration)


func decelerate_y(deceleration: float) -> void:
	velocity.y = move_toward(velocity.y, 0, deceleration)


func move() -> void:
	var character_body := owner as CharacterBody2D
	character_body.velocity = velocity
	character_body.move_and_slide()
	velocity = character_body.velocity
