tool
extends Node2D

export (PackedScene) var next_scene: PackedScene

onready var animation_player: AnimationPlayer = get_node("Area2D/AnimationPlayer")


func _get_configuration_warning() -> String:
	return "The next scene property can't be empty" if not next_scene else ""


func teleport() -> void:
	animation_player.play("fade_out")
	yield(animation_player, "animation_finished")
	get_tree().change_scene_to(next_scene)


func _on_body_entered(body: Node) -> void:
	teleport()
