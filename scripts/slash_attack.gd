class_name SlashAttack extends Attack

@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var animated_sprite2d: AnimatedSprite2D = $AnimatedSprite2D

func execute(attacker: AttackComponent, target_pos: Vector2) -> void:
	self.attacker = attacker
	var direction: Vector2
	if target_pos != Vector2.ZERO:
		direction = (target_pos - global_position).normalized()
	else:
		var mouse_pos = get_global_mouse_position()
		direction = (mouse_pos - global_position).normalized()

	damage = attacker.get_damage(self)
	position = position + direction * 20
	rotation = direction.angle()

	animation_player.play("slash")
	animated_sprite2d.play("slash")
