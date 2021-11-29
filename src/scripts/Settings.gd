extends Control

export var audio_bus_name := "Master"

onready var _bus := AudioServer.get_bus_index(audio_bus_name)


func _ready() -> void:
	$TextureRect/VBoxContainer/VBoxContainer/VBoxContainer/HSlider.value = db2linear(AudioServer.get_bus_volume_db(_bus))


func _on_HSlider_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_db(_bus, linear2db(value))


func _on_BackButton_pressed() -> void:
	if get_tree().paused:
		hide()
	else:
		get_tree().change_scene("res://src/scenes/Start.tscn")


func _on_FullscreenCheckbox_toggled(button_pressed: bool) -> void:
	OS.window_fullscreen = !OS.window_fullscreen
