class_name EnemiesManager extends Node2D

@export var enemy: PackedScene
@export var die_markers_spawn_location: Node
@export var tile_map: TileMapLayer

func _ready() -> void:
	print("EnemiesManager ready, children=", get_child_count())
	spawn_enemies(randi_range(3, 5))

func spawn_enemies(count: int) -> void:
	if !enemy or !tile_map:
		push_error("Enemy scene or tile_map not assigned")
		return
	
	var used_cells = tile_map.get_used_cells()
	if used_cells.is_empty():
		push_error("No cells available in tile_map")
		return
	
	used_cells.shuffle()
	var spawn_count = mini(count, used_cells.size())
	
	for i in range(spawn_count):
		var cell_pos = used_cells[i]
		var world_pos = tile_map.map_to_local(cell_pos)
		
		var new_enemy = enemy.instantiate()
		new_enemy.global_position = world_pos
		add_child(new_enemy)
	
	_connect_enemy_signals()


func clear_enemies() -> void:
	for enemy in get_children():
		if enemy is Enemy:
			enemy.queue_free()

func _connect_enemy_signals() -> void:
	for enemy in get_children():
		if enemy is Enemy:
			var stats = enemy.stats_component
			if stats and die_markers_spawn_location and !stats.no_health.is_connected(die_markers_spawn_location.set_die_marker):
				stats.no_health.connect(die_markers_spawn_location.set_die_marker)
