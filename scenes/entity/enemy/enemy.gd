class_name Enemy
extends CharacterBody2D


@onready var animated_sprite := $AnimatedSprite2D
@onready var left_ray_cast := $LeftRayCast
@onready var right_ray_cast := $RightRayCast
@onready var down_left_ray_cast := $DownLeftRayCast
@onready var down_right_ray_cast := $DownRightRayCast


func _ready() -> void:
	animated_sprite.play("walk")


func _process(delta: float) -> void:
	if velocity.x > 0:
		animated_sprite.scale.x = 1
	elif velocity.x < 0:
		animated_sprite.scale.x = -1
