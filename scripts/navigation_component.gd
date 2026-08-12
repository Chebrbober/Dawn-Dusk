class_name NavigationComponent extends NavigationAgent2D

@export var actor: CharacterBody2D
@export var move_component: MoveComponent
@export var update_time: float = 0.25
@export var stop_distance: float = 20
var target: Player

signal target_is_nearby(target_pos)

func _ready() -> void:
	target = GameManager.player
	makepath()

func _physics_process(delta: float) -> void:
	var remaining_distance := actor.global_position.distance_to(target_position)
	if remaining_distance <= stop_distance:
		move_component.set_target_dir(Vector2.ZERO)
		target_is_nearby.emit(target.global_position)
	else:
		var dir = (get_next_path_position() - actor.global_position).normalized()
		move_component.set_target_dir(dir)
	
func makepath() -> void:
	target_position = target.global_position

func _on_timer_timeout():
	makepath()
