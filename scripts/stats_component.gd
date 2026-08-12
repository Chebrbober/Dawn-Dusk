class_name StatsComponent extends Node

@export var blood_scene: PackedScene
@export var health: float = 100.0:
	set(value):
		health = value
		health_changed.emit()
		
		if health <= 0: no_health.emit(get_parent())

func take_damage(damage_amount: float) -> void:
	health -= damage_amount

func _on_no_health(_body: CharacterBody2D):
	if _body == GameManager.player:
		pass
	else:
		GameManager.instance_node(blood_scene, get_parent().global_position, get_parent().get_parent())
		get_parent().queue_free()

signal health_changed() 
signal no_health(body: CharacterBody2D) 
