extends Node
class_name ScoreController

@export_group("Controllers")
@export var ShapeSpawner: Node

var score: int = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	ShapeSpawner.spawned.connect(_on_spawned)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_spawned(entity: Node2D) -> void:
	print("entity spawned")
	if entity is Shape:
		print("connecting entity")
		entity.died.connect(_on_died)
		
func _on_died(amount: int):
	print("bro died")
	score += amount
	print(score)
