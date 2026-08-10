class_name MoveInputComponent
extends Node

@export var stats_component: StatsComponent
@export var move_component: MoveComponent

func _input(event: InputEvent) -> void:
	var input_axis = Input.get_vector("left", "right", "up", "down")
	move_component.set_target_velocity(input_axis * stats_component.speed)
