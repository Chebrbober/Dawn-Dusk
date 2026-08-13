class_name MoveComponent extends Node

@export var actor: Node2D
@export var velocity: Vector2
@export var speed: float = 100.0
@export var accel: float = 25.0 # higher = faster approach to target 

var _target_velocity: Vector2 = Vector2.ZERO

func _physics_process(delta: float) -> void:
	if not actor:
		return

	var alpha = 1.0 - exp(-accel * delta)
	velocity = velocity.lerp(_target_velocity, alpha)

	actor.translate(velocity * delta)
	actor.move_and_slide()

func set_target_dir(dir: Vector2) -> void:
	var new_velocity = dir * speed
	if new_velocity == _target_velocity:
		return
	_target_velocity = new_velocity