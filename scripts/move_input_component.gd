class_name MoveInputComponent
extends Node

@export var move_component: MoveComponent
@export var speed: float = 100.0

func _input(event: InputEvent) -> void:
	var input_axis = Input.get_vector("left", "right", "up", "down")
	move_component.set_target_velocity(input_axis * speed)
