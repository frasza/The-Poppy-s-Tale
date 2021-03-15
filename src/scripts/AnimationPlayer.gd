extends AnimationPlayer


func jump_direction_animation(facing_direction: int):
	if facing_direction == -1:
		play("jump_facing_left")
	else:
		play("jump_facing_right")


func _on_Character_animate(
	movement: Vector2, 
	is_attacking: bool, 
	facing_direction: int, 
	is_alive: bool,
	is_on_floor: bool) -> void:
		
	var is_not_jumping: bool = movement.y == 0
	var is_not_walking: bool = movement.x == 0
	
	if movement.y < 0 and is_alive:
		jump_direction_animation(facing_direction)
	elif movement.y > 0 and is_alive and not is_on_floor:
		jump_direction_animation(facing_direction)
	elif movement.x != 0 and is_not_jumping and not is_attacking and is_alive:
		play("walk")
	elif movement.x != 0 and is_not_jumping and is_attacking and is_alive:
		play("walk_attack")
	elif is_attacking and is_alive:
		play("attack")
	elif is_not_jumping and is_not_walking and is_alive:
		play("idle")
	elif not is_alive:
		play("die")
