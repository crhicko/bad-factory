extends Control
class_name UiController

@export var score_controller: ScoreController

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	score_controller.score_changed.connect(_on_score_changed)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func _on_score_changed(amount: int):
	$ScoreLabel.text = "Score: " + str(amount);
