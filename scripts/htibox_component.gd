class_name HitBoxComponent extends Area2D

@export var attack_component: AttackComponent

func _ready() -> void:
	area_entered.connect(_on_hurtbox_entered)

func _on_hurtbox_entered(hurtbox: HurtBoxComponent) -> void:
	if not hurtbox is HurtBoxComponent: return
	hurtbox.hurt.emit(attack_component.damage)