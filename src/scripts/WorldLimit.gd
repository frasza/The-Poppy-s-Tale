extends Area2D


func _on_WorldLimit_body_entered(body: Node) -> void:
	get_tree().call_group("gamestate", "hurt", true)
