extends PanelContainer


func _ready() -> void:
	pass # Replace with function body.


func _process(delta: float) -> void:
	pass


func _on_back_pressed() -> void:
	get_parent().get_node("MainButtons").visible = true
	visible = false
