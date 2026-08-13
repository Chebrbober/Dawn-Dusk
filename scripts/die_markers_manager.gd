extends Node

@export var die_marker_scene: PackedScene

func set_die_marker(enemy: Enemy) -> void:
	var die_marker_instance = die_marker_scene.instantiate()
	die_marker_instance.data = enemy.attack_component.get_attacks_type()
	die_marker_instance.global_position = enemy.global_position
	add_child.call_deferred(die_marker_instance)