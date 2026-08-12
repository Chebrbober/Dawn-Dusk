extends Node2D

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@export var duration: float = 30
var target_modulate: Color = Color8(255,255,255,0)
var tween: Tween

func _ready() -> void:
	animated_sprite_2d.play("default")
	tween = create_tween()
	tween.tween_property(self, "modulate", target_modulate, duration)
	await tween.finished
	queue_free()
