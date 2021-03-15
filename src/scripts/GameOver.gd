extends Control


func _on_PlayAgainButton_pressed() -> void:
	get_tree().change_scene("res://src/scenes/Levels/Level01.tscn")


func _on_QuitButton_pressed() -> void:
	get_tree().quit()
