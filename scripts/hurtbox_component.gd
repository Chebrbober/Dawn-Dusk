class_name HurtBoxComponent extends Area2D

@export var stats_component: StatsComponent

signal hurt(damage_amount: float)

func _ready() -> void:
	hurt.connect(_on_hurt)

func _on_hurt(damage_amount: float) -> void:
	stats_component.take_damage(damage_amount)
	print("damaged")