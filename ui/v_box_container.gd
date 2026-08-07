extends VBoxContainer

func _ready() -> void:
	for button in get_children():
		if button is Button:
			button.pivot_offset_ratio = Vector2(0.5, 0.5)