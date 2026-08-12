class_name AttackComponent extends Node2D

@export var base_damage: float = 10.0
@export var cooldown: float = 1
var can_attack: bool = true

func _on_attack_executed() -> void:
	if can_attack:
		can_attack = false
		await get_tree().create_timer(cooldown).timeout
		can_attack = true

func attack(target_pos: Vector2 = Vector2.ZERO) -> void:
	if can_attack:
		for attack in get_children():
			if attack is Attack:
				attack.execute(self, target_pos)
				_on_attack_executed()
	
func get_damage(attack: Attack) -> float:
	return base_damage + attack.damage_bonus
