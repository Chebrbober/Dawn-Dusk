class_name StatsComponent extends Node

@export var health: float = 100.0:
	set(value):
		health = value
		health_changed.emit()
		
		if health <= 0: no_health.emit()

func take_damage(damage_amount: float) -> void:
	health -= damage_amount

signal health_changed() 
signal no_health() 