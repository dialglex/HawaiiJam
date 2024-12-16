extends Node

const IR_WAVELENGTH = 0.0
const V_WAVELENGTH = 0.5
const UV_WAVELENGTH = 1.0
const WAVELENGTH_SPEED = 0.5
const WAVELENGTH_TRANSITION_SPEED = 5.0
const WAVELENGTH_SPECIFICITY = 8.0

var wavelength := 0.5
var target_wavelength := V_WAVELENGTH

@onready var slider := %Slider
@onready var point := %Point

@export var ir: Node2D
@export var v: Node2D
@export var uv: Node2D


func _process(delta: float) -> void:
	#wavelength += Input.get_axis("decrease_wavelength", "increase_wavelength")*WAVELENGTH_SPEED*delta
	#wavelength = clamp(wavelength, IR_WAVELENGTH, UV_WAVELENGTH)
	if Input.is_action_just_pressed("decrease_wavelength"):
		target_wavelength -= 0.5
	if Input.is_action_just_pressed("increase_wavelength"):
		target_wavelength += 0.5
	target_wavelength = clamp(target_wavelength, IR_WAVELENGTH, UV_WAVELENGTH)
	wavelength = lerp(wavelength, target_wavelength, 1 - exp(-WAVELENGTH_TRANSITION_SPEED*delta))
	
	ir.material.set_shader_parameter("alpha", 0.0)
	v.self_modulate.a = 0
	uv.material.set_shader_parameter("alpha", 0.0)
	if wavelength < 1.0/3.0:
		ir.material.set_shader_parameter("alpha", cos(WAVELENGTH_SPECIFICITY*(wavelength - IR_WAVELENGTH)))
	elif wavelength < 2.0/3.0:
		v.self_modulate.a = cos(WAVELENGTH_SPECIFICITY*(wavelength - V_WAVELENGTH))
	else:
		uv.material.set_shader_parameter("alpha", cos(WAVELENGTH_SPECIFICITY*(wavelength - UV_WAVELENGTH)))
	
	point.position.x = lerp(0.0, slider.custom_minimum_size.x, wavelength)
