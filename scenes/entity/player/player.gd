class_name Player
extends CharacterBody2D


var death_particles_scene := preload("res://scenes/particle/death_particles.tscn")
var starting_position: Vector2
@onready var animated_sprite := $AnimatedSprite2D
@onready var death_sounds := [$DeathSound1, $DeathSound2]
@onready var walking_sound := $WalkingSound


func _ready() -> void:
	starting_position = position


func _process(delta: float) -> void:
	if velocity.x > 0:
		animated_sprite.scale.x = 1
	elif velocity.x < 0:
		animated_sprite.scale.x = -1
	if is_on_floor():
		if velocity.x == 0:
			animated_sprite.play("idle")
			walking_sound.stop()
		else:
			if not walking_sound.playing:
				walking_sound.play()
			animated_sprite.play("walk")
	else:
		walking_sound.stop()
		animated_sprite.play("air")


func _on_door_area_area_entered(_area: Area2D) -> void:
	var level_manager := get_tree().get_first_node_in_group("level_manager") as LevelManager
	level_manager.end = true


func _on_enemy_area_area_entered(area: Area2D) -> void:
	death_sounds[randi()%2].play()
	var death_particles := death_particles_scene.instantiate()
	get_tree().root.get_child(0).add_child(death_particles)
	death_particles.position = position + Vector2(0, -32)
	death_particles.emitting = true
	position = starting_position
