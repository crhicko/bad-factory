extends CanvasLayer
class_name UiController

@export var score_controller: ScoreController
@export var timer: Timer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	score_controller.score_changed.connect(_on_score_changed)
	$CenterContainer/VBoxContainer/ScoreLabel.text = "Score: 0"


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	$CenterContainer/VBoxContainer/TimeLabel.text = str("%10.0f" % timer.time_left)
	
func _on_score_changed(amount: int):
	$CenterContainer/VBoxContainer/ScoreLabel.text = "Score: " + str(amount);
