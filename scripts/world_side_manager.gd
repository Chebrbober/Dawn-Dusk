extends Node

@onready var shader_rect: ColorRect = $CanvasLayer/ShaderRect
@onready var enemies: Node = %EnemiesManager
enum WorldSides {
	LIGHT,
	NIGHT
}
var current_world_side: WorldSides = WorldSides.NIGHT

func _ready() -> void:
	GameManager.player.stats_component.no_health.connect(switch_world_side)

func switch_world_side(_body: CharacterBody2D) -> void:
	if current_world_side == WorldSides.NIGHT:
		shader_rect.visible = true
		for enemy in enemies.get_children():
			enemy.queue_free()
	else:
		shader_rect.visible = false
