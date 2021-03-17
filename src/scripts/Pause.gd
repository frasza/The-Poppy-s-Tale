extends Control


func toggle_off_pause():
	get_tree().paused = false
	visible = false


func _input(event: InputEvent) -> void:
	if Input.is_action_just_released("ui_cancel"):
		var new_pause_state: bool = not get_tree().paused
		get_tree().paused = new_pause_state
		visible = new_pause_state


func _on_ResumeButton_pressed() -> void:
	toggle_off_pause()


func _on_SettingsButton_pressed() -> void:
	get_tree().change_scene("res://src/scenes/Settings.tscn")


func _on_BackButton_pressed() -> void:
	toggle_off_pause()
	get_tree().change_scene("res://src/scenes/Start.tscn")


func _on_QuitButton_pressed() -> void:
	get_tree().quit()
