extends Node2D
const EXPLODE = preload("res://assets/explode.wav")
const GEM = preload("res://Scenes/Gem/Gem.tscn")
const MARGIN : float = 70.0

@onready var score_sound: AudioStreamPlayer2D = $ScoreSound
@onready var spawn_timer: Timer = $SpawnTimer
@onready var paddle: Area2D = $Paddle
@onready var sound: AudioStreamPlayer = $Sound
@onready var score_label: Label = $ScoreLabel

var _score: int = 0

func  _ready() -> void:
	spawn_gem()
	
func spawn_gem() -> void:
	var new_gem: Gem = GEM.instantiate()
	var x_pos: float = randf_range(
		get_viewport_rect().position.x + MARGIN, 
		get_viewport_rect().end.x - MARGIN
	)
	new_gem.position = Vector2(x_pos, - MARGIN)
	new_gem.gem_off_screen.connect(_on_gem_off_screen)
	
	add_child(new_gem)
	
func stop_all() -> void:
	sound.stop()
	sound.stream = EXPLODE
	sound.play()
	
	spawn_timer.stop()
	paddle.set_process(false)
	for child in get_children():
		if child is Gem:
			child.set_process(false)

func _on_paddle_area_entered(area: Area2D) -> void:
	_score += 1
	score_label.text = "%03d" % _score
	
	if score_sound.playing == false:
		score_sound.position = area.position
		score_sound.play()
	
	print("Game:: Collision", area)

func _on_gem_off_screen() -> void:
	stop_all()
	print("Game over")
	
func _on_timer_timeout() -> void:
	spawn_gem()
	print("Timer signal recevied")
