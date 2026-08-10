class_name SlashAttack extends Attack

@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var animated_sprite2d: AnimatedSprite2D = $AnimatedSprite2D

func execute(attacker: AttackComponent) -> void:
	var mouse_pos = get_global_mouse_position()
	var direction = (mouse_pos - global_position).normalized()
	damage = attacker.get_damage(self)
	position = position + direction * 50
	rotation = direction.angle()

	animation_player.play("slash")
	animated_sprite2d.play("slash")

	await animation_player.animation_finished
	position = Vector2.ZERO
	print(damage)
