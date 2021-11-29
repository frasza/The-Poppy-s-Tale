extends Control


func _on_PlayButton_pressed() -> void:
	Globals.game_reset()
	get_tree().change_scene("res://src/scenes/InBedScene.tscn")


func _on_HowToPlayButton_pressed() -> void:
	pass


func _on_SettingsButton_pressed() -> void:
	get_tree().change_scene("res://src/scenes/Settings.tscn")


func _on_QuitButton_pressed() -> void:
	get_tree().quit()
