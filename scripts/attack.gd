class_name Attack extends Node2D

@export var damage_bonus: float = 0.0
var damage: float = 0.0
var attacker: AttackComponent

func execute(attacker: AttackComponent) -> void:
	self.attacker = attacker