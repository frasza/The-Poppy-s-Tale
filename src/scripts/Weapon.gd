extends Position2D

const Bubble = preload("res://src/scenes/Bubble.tscn")

func shoot(direction: int = 1) -> bool:
	# Randomize bubble spawning
	randomize()
	var random_number_of_bubbles = randi() % 6 + 1
	for i in random_number_of_bubbles:
		var random_offset: Vector2
		if direction == 1:
			random_offset = Vector2(rand_range(50, 151), rand_range(1, 61))
		else:
			random_offset = Vector2(rand_range(-50, -151), rand_range(-1, 61))
		var bubble: Bubble = Bubble.instance()
		bubble.global_position = global_position + random_offset
		bubble.linear_velocity = Vector2(direction * bubble.speed, 0)
	
		bubble.set_as_toplevel(true)
		add_child(bubble)
		
	return true
