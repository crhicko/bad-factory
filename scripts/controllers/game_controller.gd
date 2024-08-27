extends Node

@export var score_controller: ScoreController
@export var game_over_screen: CanvasLayer
@onready var timer: Timer = $Timer
@export var enable_timer: bool = true

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	timer.timeout.connect(_on_timer_timeout)
	if !enable_timer: timer.stop()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_timer_timeout() -> void:
	print_rich("[color=green][b]Game OVER !!!!![/b][/color]")
	score_controller.enable_scoring = false;
	game_over_screen.visible = true
