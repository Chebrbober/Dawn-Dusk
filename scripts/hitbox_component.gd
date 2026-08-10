class_name HitBoxComponent extends Area2D

func _ready() -> void:
	area_entered.connect(_on_hurtbox_entered)

func _on_hurtbox_entered(hurtbox: HurtBoxComponent) -> void:
	if not hurtbox is HurtBoxComponent: return
	var attack = get_parent() as Attack
	if attack:
		hurtbox.hurt.emit(attack.damage)
