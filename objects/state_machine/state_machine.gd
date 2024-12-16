class_name StateMachine
extends Node


signal state_changed(state_name: String)

var state: State


func _ready() -> void:
	state = get_child(0)


func physics_process(host: Node, delta: float) -> void:
	var state_name := state.physics_process(host, delta)
	if not state_name == "":
		change_state(state_name)


func change_state(state_name: String) -> void:
	state.exit()
	state = get_node(state_name)
	state_changed.emit(state_name)
	state.enter()
