extends Node

@export var die_markers_spawn_location: Node

func _ready() -> void:
	print("EnemiesManager ready, children=", get_child_count())
	_connect_enemy_signals()

func _connect_enemy_signals() -> void:
	for enemy in get_children():
		if enemy is Enemy:
			var stats = enemy.stats_component
			if stats and die_markers_spawn_location and !stats.no_health.is_connected(die_markers_spawn_location.set_die_marker):
				# The signal emits the enemy (get_parent()), so don't bind the enemy here — connect directly.
				stats.no_health.connect(die_markers_spawn_location.set_die_marker)
