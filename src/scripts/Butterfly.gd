extends Node2D

var taken: bool = false

onready var sfx = $Area2D/PickUpSFX
onready var animation = $Area2D/AnimationPlayer


func pick_up():
	queue_free()


func _on_Area2D_body_entered(body: Node) -> void:
	if not taken:
		taken = true
		sfx.play()
		animation.play("pickup")
		get_tree().call_group("gamestate", "butterfly_up")
