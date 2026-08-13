extends Node

@onready var shader_rect: ColorRect = $CanvasLayer/ShaderRect
@onready var enemies: Node = %EnemiesManager
var player_stats: StatsComponent

enum WorldSides {
	LIGHT,
	NIGHT
}
var current_world_side: WorldSides = WorldSides.NIGHT

func _ready() -> void:
	if GameManager.player != null:
		player_stats = GameManager.player.stats_component
		if !player_stats.no_health.is_connected(switch_world_side):
			player_stats.no_health.connect(switch_world_side)
			print("connected to the callable")
	else:
		call_deferred("_deferred_connect_to_player")

func _deferred_connect_to_player() -> void:
	if GameManager.player == null:
		return
	player_stats = GameManager.player.stats_component

	if !player_stats.no_health.is_connected(switch_world_side):
		player_stats.no_health.connect(switch_world_side)
		print("connected to the callable")

func switch_world_side(_body: CharacterBody2D) -> void:
	if current_world_side == WorldSides.NIGHT:
		shader_rect.visible = true
		for enemy in enemies.get_children():
			if enemy is Enemy:
				enemy.queue_free()
	else:
		shader_rect.visible = false
	Signals.world_side_changed.emit()
