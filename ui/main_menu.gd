extends Control

@export_file("*.tscn") var game_scene: String

func _on_exit_pressed() -> void:
	get_tree().quit()

func _on_credits_pressed() -> void:
	pass

func _on_options_pressed() -> void:
	pass # Replace with function body.

func _on_play_pressed() -> void:
	TransitionScene.transition_to(game_scene)
