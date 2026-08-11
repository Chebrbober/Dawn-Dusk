class_name AttackInputComponent extends Node

@export var attack_component: AttackComponent

func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.is_pressed():
		attack_component.attack()
