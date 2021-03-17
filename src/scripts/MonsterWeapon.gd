extends Position2D

const MonsterBubble = preload("res://src/scenes/MonsterBubble.tscn")


func shoot() -> void:
	var bubble: MonsterBubble = MonsterBubble.instance()
	bubble.global_position = global_position
	bubble.linear_velocity = Vector2(bubble.speed, 0)
		
	bubble.set_as_toplevel(true)
	add_child(bubble)
