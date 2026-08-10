class_name MoveComponent extends Node

@export var actor: Node2D
@export var velocity: Vector2
@export var accel_time: float = 0.1
@export var tween_trans_type: Tween.TransitionType = Tween.TransitionType.TRANS_QUAD
@export var tween_ease_type: Tween.EaseType = Tween.EaseType.EASE_IN_OUT

var _target_velocity: Vector2 = Vector2.ZERO
var _velocity_tween: Tween = null

func _physics_process(delta: float) -> void:
	actor.translate(velocity * delta)

func set_target_velocity(new_velocity: Vector2) -> void:
	if new_velocity == _target_velocity:
		return

	_target_velocity = new_velocity
	if _velocity_tween:
		_velocity_tween.kill()

	_velocity_tween = create_tween().set_trans(tween_trans_type).set_ease(tween_ease_type)
	_velocity_tween.tween_property(self, "velocity", _target_velocity, accel_time)