extends Node2D

var music_player: AudioStreamPlayer
var current_song: String = ""

var songs = {
	"menu": preload("res://sound/Across the space.ogg"),
	"game": preload("res://sound/Seeing the stars.ogg"), 
	"end": preload("res://sound/Was it worth it.ogg")
}

func play_song(song_name: String):
	if song_name == current_song and music_player.playing:
		return
	
	if songs.has(song_name):
		music_player.stream = songs[song_name]
		music_player.play()
		current_song = song_name
	else:
		push_error("Song not found: " + song_name)

func stop_music():
	music_player.stop()
	current_song = ""

func toggle_pause():
	if music_player.playing:
		music_player.stream_paused = !music_player.stream_paused

func set_volume(volume: float):
	music_player.volume_db = linear_to_db(volume)

func _ready():
	music_player = AudioStreamPlayer.new()
	add_child(music_player)
	play_song("game")
	#music_player.volume_db = +10.0

func process():
	if(music_player.finished):
		play_song("game")
