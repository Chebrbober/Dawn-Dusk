extends Node

@onready var shader_rect: ColorRect = $CanvasLayer/ShaderRect
@onready var enemies: Node = %EnemiesManager
var player_stats: StatsComponent

enum WorldSides {
	LIGHT,
	NIGHT
}
var current_world_side: WorldSides = WorldSides.NIGHT

func _input(event: InputEvent) -> void:
	if current_world_side == WorldSides.LIGHT:
		if event is InputEventKey and event.is_action_pressed("return"):
			switch_world_side()

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

func switch_world_side(_body: CharacterBody2D = GameManager.player) -> void:
	if current_world_side == WorldSides.NIGHT:
		current_world_side = WorldSides.LIGHT
		shader_rect.visible = true
		enemies.clear_enemies()
	else:
		current_world_side = WorldSides.NIGHT
		shader_rect.visible = false
		player_stats.rebirth()
		enemies.spawn_enemies(randi_range(3,5))
	Signals.world_side_changed.emit()
