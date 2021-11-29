extends Node2D

export (PackedScene) var next_scene: PackedScene

func go_to_next_scene() -> void:
	get_tree().change_scene_to(next_scene)
