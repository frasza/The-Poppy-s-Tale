extends KinematicBody2D

var health: int = 100


func take_damage(damage: int):
	health -= damage
	if health <= 0:
		die()


func die():
	queue_free()


func _on_Area2D_body_entered(body: Node) -> void:
	if body.has_method("hurt"):
		get_tree().call_group("gamestate", "hurt")
