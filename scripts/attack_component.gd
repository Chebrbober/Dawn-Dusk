class_name AttackComponent extends Node2D

@export var base_damage: float = 10.0
@export var damage_bonus_multiplier: float = 1.5
@export var cooldown: float = 1
var can_attack: bool = true
var scale_factor: Vector2 = Vector2(0.1, 0.1)

func _on_attack_executed() -> void:
	if can_attack:
		can_attack = false
		await get_tree().create_timer(cooldown).timeout
		can_attack = true

func attack(target_pos: Vector2 = Vector2.ZERO) -> void:
	if can_attack:
		for atk in get_children():
			if atk is Attack:
				atk.execute(self, target_pos)
				_on_attack_executed()
	
func get_damage(atk: Attack) -> float:
	return base_damage + atk.damage_bonus

func get_attacks_type() -> Array[Attack]:
	var attack_types_array: Array[Attack] = []
	for atk in get_children():
		if atk is Attack:
			attack_types_array.append(atk.duplicate())
	return attack_types_array

func set_new_attack(atk: Attack) -> void:
	for current_atk in get_children():
		if current_atk is Attack and current_atk.get_class() == atk.get_class():
			current_atk.scale += scale_factor
			current_atk.damage_bonus *= damage_bonus_multiplier
			return

	add_child(atk)