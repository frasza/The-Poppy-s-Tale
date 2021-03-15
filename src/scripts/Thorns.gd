extends Node2D


func _on_Area2D_body_entered(body: Node) -> void:
	if body.has_method("hurt"):
		get_tree().call_group("gamestate", "hurt")
