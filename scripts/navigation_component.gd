class_name NavigationComponent extends NavigationAgent2D

@export var actor: CharacterBody2D
@export var move_component: MoveComponent
@export var update_time: float = 0.25
var target: Player

func _ready() -> void:
	target = GameManager.player
	makepath()

func _physics_process(delta: float) -> void:
	if !is_target_reached():
		var dir = (get_next_path_position() - actor.global_position).normalized()
		move_component.set_target_dir(dir)

func makepath() -> void:
	target_position = target.global_position

func _on_timer_timeout():
	makepath()
