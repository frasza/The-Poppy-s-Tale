class_name MonsterBubble
extends RigidBody2D

export var damage: int = 20
export var speed: int = -1000

var velocity: Vector2 = Vector2.ZERO

onready var bubble_audio: AudioStreamPlayer = get_node("BubbleSound")


func _ready() -> void:
	play_sfx()


func play_sfx():
	bubble_audio.play()


func _on_VisibilityNotifier2D_screen_exited() -> void:
	queue_free()


func _on_Bubble_body_entered(body: Node) -> void:
	if body.has_method("hurt"):
		get_tree().call_group("gamestate", "hurt")
	queue_free()
