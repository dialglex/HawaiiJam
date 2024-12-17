class_name LevelManager
extends Node


const background_transition_speed = 2.0
var end := false
@export var next_level: PackedScene
@onready var background := %Background


func _process(delta: float) -> void:
	if end:
		if background.modulate.a < 1.0:
			background.modulate.a += background_transition_speed*delta
		else:
			pass
			#get_tree().change_scene_to_packed.call_deferred(next_level)
	elif background.modulate.a > 0.0:
		background.modulate.a -= background_transition_speed*delta
