extends CharacterBody2D


@export var next_level: PackedScene


func _on_door_area_area_entered(_area: Area2D) -> void:
	get_tree().change_scene_to_packed.call_deferred(next_level)
