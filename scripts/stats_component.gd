class_name StatsComponent extends Node

@export var health: float = 100.0:
	set(value):
		health = value
		
		health_changed.emit()
		
		if health <= 0: no_health.emit()

@export var speed: float = 100.0:
	set(value):
		speed = value
		speed_changed.emit()

@export var damage: float = 1.0:
	set(value):
		damage = value
		damage_changed.emit()

signal health_changed() 
signal speed_changed()
signal damage_changed()
signal no_health() 