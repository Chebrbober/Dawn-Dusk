class_name SlashAttack extends Attack

@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var animated_sprite2d: AnimatedSprite2D = $AnimatedSprite2D

func execute(attacker: AttackComponent) -> void:
	var total_damage := attacker.get_damage(self)
	# here
	animation_player.play("slash")
	animated_sprite2d.play("slash")

	print(total_damage)

