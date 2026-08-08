extends PanelContainer

@export var audio_container_scene: PackedScene
@onready var settings_container: VBoxContainer = %SettingsContainer

func _ready() -> void:
	for bus in AudioServer.get_bus_count():
		var bus_name = AudioServer.get_bus_name(bus)
		var audio_container = audio_container_scene.instantiate()
		audio_container.name = bus_name
		audio_container.get_node("AudioController").audio_bus_name = bus_name
		audio_container.get_node("Label").text = bus_name
		settings_container.add_child(audio_container)

func _on_back_pressed() -> void:
	get_parent().get_node("MainButtons").visible = true
	visible = false
