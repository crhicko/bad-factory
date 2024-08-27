extends Node
class_name ScoreController

@export_group("Required Nodes")
@export var shape_spawner: ShapeSpawner

var enable_scoring: bool = true
var score: int = 0

signal score_changed(amount)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	shape_spawner.spawned.connect(_on_spawned)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_spawned(entity: Node2D) -> void:
	print("entity spawned")
	if entity is Shape:
		print("connecting entity")
		entity.died.connect(_on_died)
		
func _on_died(body: Shape, amount: int):
	## this var gets set by the game controller when the game ends
	if !enable_scoring:
		pass
	score += amount
	print("Score: ", score)
	score_changed.emit(score)
