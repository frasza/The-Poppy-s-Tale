extends CanvasLayer

onready var life_count_text: Label = $Control/TextureRect/Horizontal/ContainerL/LifeLabel
onready var butterfly_count_text: Label = $Control/TextureRect/Horizontal/ContainerB/ButterflyLabel


func update_gui(lives: int, butterflies: int):
	life_count_text.text = str(lives)
	butterfly_count_text.text = str(butterflies)
