class_name HurtComponent extends Node

@export var sprite: Node2D 
@export var color: Color = Color.RED
@export var duration: float = 0.1
@export_range(0.0, 1.0, 0.01) var opacity: float = 0.7
@export var hurt_shader: ShaderMaterial
var tween: Tween

func _ready() -> void:
	hurt_shader.set_shader_parameter("hit_color", color)
	sprite.material = hurt_shader

func _on_hurt() -> void:
	if tween:
		tween.kill()
	tween = create_tween().set_trans(Tween.TRANS_QUINT)

	tween.tween_method(func(v):
		hurt_shader.set_shader_parameter("hit_opacity", v), 0.0, opacity, duration)

	await tween.finished

	if tween:
		tween.kill()
	tween = create_tween().set_trans(Tween.TRANS_QUINT)
	tween.tween_method(func(v):
		hurt_shader.set_shader_parameter("hit_opacity", v), opacity, 0.0, duration)
