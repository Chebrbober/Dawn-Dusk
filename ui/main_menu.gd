extends Control

@export_file("*.tscn") var game_scene: String
@onready var options: PanelContainer = $Options

var tween: Tween = null

func _ready() -> void:
	options.visible = false
	tween = create_tween()

	for child in get_children():
		child.scale = Vector2.ZERO
		child.pivot_offset_ratio = Vector2(0.5, 0.5)

	for child in get_children():
		tween.tween_property(child, "scale", Vector2.ONE, 0.5).set_trans(Tween.TRANS_CUBIC)
		tween.tween_interval(0.1)


func _on_exit_pressed() -> void:
	get_tree().quit()

func _on_credits_pressed() -> void:
	pass

func _on_options_pressed() -> void:
	options.visible = true
	$MainButtons.visible = false

func _on_play_pressed() -> void:
	TransitionScene.transition_to(game_scene)
