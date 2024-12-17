extends CharacterBody2D


var starting_position: Vector2
@export var next_level: PackedScene


func _ready() -> void:
	starting_position = position


func _on_door_area_area_entered(_area: Area2D) -> void:
	get_tree().change_scene_to_packed.call_deferred(next_level)


func _on_enemy_area_area_entered(area: Area2D) -> void:
	position = starting_position
