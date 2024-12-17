class_name Player
extends CharacterBody2D


var starting_position: Vector2


func _ready() -> void:
	starting_position = position


func _on_door_area_area_entered(_area: Area2D) -> void:
	var level_manager := get_tree().get_first_node_in_group("level_manager") as LevelManager
	level_manager.end = true


func _on_enemy_area_area_entered(area: Area2D) -> void:
	position = starting_position
