class_name AttackComponent extends Node2D

@export var base_damage: float = 10.0

func set_attack(attack_type: Resource) -> void:
	var attack_instance = attack_type.instantiate()
	add_child(attack_instance)

func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		attack()

func attack() -> void:
	for attack in get_children():
		if attack is Attack:
			attack.execute(self)
	
func get_damage(attack: Attack) -> float:
	return base_damage + attack.damage_bonus