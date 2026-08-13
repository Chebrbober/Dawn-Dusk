extends Marker2D

@export var data: Array[Attack]
@onready var area_2d: Area2D = $Area2D

var player_in_area: Player

func _ready() -> void:
	Signals.world_side_changed.connect(_on_world_side_changed)

func _process(_delta: float) -> void:
	if player_in_area and Input.is_action_just_pressed("interact"):
		_on_player_interact(player_in_area)

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body is Player:
		player_in_area = body
		print("player entered", player_in_area)

func _on_area_2d_body_exited(body: Node2D) -> void:
	if body is Player and player_in_area == body:
		player_in_area = null
		print("player exited", player_in_area)

func _on_player_interact(player: Player) -> void:
	print(data)
	for attack in data:
		player.attack_component.set_new_attack(attack)
	queue_free()

func _on_world_side_changed() -> void:
	if area_2d.monitoring == true:
		area_2d.set_deferred("monitoring", false)
	else:
		area_2d.set_deferred("monitoring", true)
