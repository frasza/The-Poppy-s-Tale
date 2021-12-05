tool
extends Node2D

export(Texture) var first_part: Texture
export(Texture) var second_part: Texture


func _ready():
	$Body/Sprite.texture = first_part
	$Body/Sprite2.texture = second_part


func _get_configuration_warning() -> String:
	return "Sprites can't be empty" if not first_part and not second_part else ""
