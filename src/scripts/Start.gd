extends Control

onready var animation_player: AnimationPlayer = $AnimationPlayer


func _on_PlayButton_pressed() -> void:
	Globals.game_reset()
	animation_player.play("fade_out")
	yield(animation_player, "animation_finished")
	get_tree().change_scene("res://src/scenes/InBedScene.tscn")


func _on_HowToPlayButton_pressed() -> void:
	pass


func _on_SettingsButton_pressed() -> void:
	get_tree().change_scene("res://src/scenes/Settings.tscn")


func _on_QuitButton_pressed() -> void:
	get_tree().quit()
