class_name Player extends CharacterBody2D

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var move_component: MoveComponent = $MoveComponent
@onready var stats_component: StatsComponent = $StatsComponent

func _init() -> void:
	GameManager.player = self

func _process(delta: float) -> void:
	animate_the_ship()

func animate_the_ship() -> void:
	if move_component.velocity.x < 0:
		animated_sprite_2d.play("left")
	elif move_component.velocity.x > 0:
		animated_sprite_2d.play("right")
	elif move_component.velocity.y > 0:
		animated_sprite_2d.play("down")
	elif move_component.velocity.y < 0:
		animated_sprite_2d.play("up")
	else:
		animated_sprite_2d.play("down")
