extends Control

@export_file("*.tscn") var game_scene: String

var tween: Tween = null

func _ready() -> void:
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
	pass # Replace with function body.

func _on_play_pressed() -> void:
	TransitionScene.transition_to(game_scene)
