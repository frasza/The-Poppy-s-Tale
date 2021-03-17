extends "res://src/scripts/Enemy.gd"


func die():
	$MoanSFX.play()
	queue_free()


func play_moan_sfx():
	$MoanSFX.play()
