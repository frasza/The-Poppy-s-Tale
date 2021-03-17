extends "res://src/scripts/Enemy.gd"

onready var sprite: Sprite = get_node("Sprite")
onready var weapon: Position2D = sprite.get_node("Weapon")
onready var animation_tree: AnimationNodeStateMachinePlayback = get_node("AnimationTree").get("parameters/playback")


func _ready() -> void:
	animation_tree.start("idle")


func _process(delta: float) -> void:
	if $RayCast2D.is_colliding():
		shoot()


func shoot():
	animation_tree.travel("attack")
