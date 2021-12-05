extends Node

onready var audio_player: AudioStreamPlayer = $AudioStreamPlayer

var music_is_playing: bool


func _ready():
	music_is_playing = audio_player.playing


func toggle_music_playing() -> void:
	audio_player.stop() if music_is_playing else audio_player.play()
	music_is_playing = not music_is_playing
