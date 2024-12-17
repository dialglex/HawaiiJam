class_name Player
extends CharacterBody2D


var death_particles_scene := preload("res://scenes/particle/death_particles.tscn")
var starting_position: Vector2


func _ready() -> void:
	starting_position = position


func _on_door_area_area_entered(_area: Area2D) -> void:
	var level_manager := get_tree().get_first_node_in_group("level_manager") as LevelManager
	level_manager.end = true


func _on_enemy_area_area_entered(area: Area2D) -> void:
	var death_particles := death_particles_scene.instantiate()
	get_tree().root.get_child(0).add_child(death_particles)
	death_particles.position = position + Vector2(0, -32)
	death_particles.emitting = true
	position = starting_position
