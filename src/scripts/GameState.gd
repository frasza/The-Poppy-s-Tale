extends Node2D

var target_number_of_butterflies: int = 10


func _ready() -> void:
	add_to_group("gamestate")
	update_gui()


func update_gui():
	get_tree().call_group("gui", "update_gui", Globals.lives, Globals.butterflies)


func hurt(world_limit: bool = false):
	if not world_limit:
		$Character.hurt()
		life_down(1)
	else:
		life_down(1)
	update_gui()


func butterfly_up():
	Globals.butterflies += 1
	update_gui()
	var is_multiple_of_butterflies: bool = (Globals.butterflies % target_number_of_butterflies) == 0
	if is_multiple_of_butterflies:
		Globals.butterflies -= 10
		life_up()


func life_up():
	Globals.lives += 1
	update_gui()


func life_down(time: float):
	Globals.lives -= 1
	if Globals.lives < 1:
		game_over(time)
	else:
		yield(get_tree().create_timer(time), "timeout") # Wait before scene reload
		get_tree().reload_current_scene()


func game_over(time: float):
	yield(get_tree().create_timer(time), "timeout") # Wait before scene reload
	get_tree().change_scene("res://src/scenes/GameOver.tscn")
	Globals.game_reset()
