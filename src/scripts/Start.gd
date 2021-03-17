extends Control


func _on_PlayButton_pressed() -> void:
	get_tree().change_scene("res://src/scenes/Levels/Level01.tscn")


func _on_HowToPlayButton_pressed() -> void:
	pass


func _on_SettingsButton_pressed() -> void:
	get_tree().change_scene("res://src/scenes/Settings.tscn")


func _on_QuitButton_pressed() -> void:
	get_tree().quit()
