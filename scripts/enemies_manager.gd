extends Node

@onready var die_markers: Node = get_parent().get_node("DieMarkersManager")

func _ready() -> void:
	print("EnemiesManager ready, children=", get_child_count())
	_connect_enemy_signals()

func _connect_enemy_signals() -> void:
	for enemy in get_children():
		if enemy is Enemy:
			var stats = enemy.stats_component
			if stats and !stats.no_health.is_connected(die_markers.set_die_marker):
				stats.no_health.connect(die_markers.set_die_marker)
				print("connected no_health from", enemy.name, "to die markers")
