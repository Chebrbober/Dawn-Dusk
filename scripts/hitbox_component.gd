class_name HitBoxComponent extends Area2D

func _ready() -> void:
	area_entered.connect(_on_hurtbox_entered)

func _on_hurtbox_entered(hurtbox: Area2D) -> void:
	if not hurtbox is HurtBoxComponent: return
	var attack = get_parent() as Attack
	if not attack:
		return
	if not attack.attacker:
		return
	if attack.attacker.get_parent() == hurtbox.get_parent():
		return

	hurtbox.hurt.emit(attack.damage)
