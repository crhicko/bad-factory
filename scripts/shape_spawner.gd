extends Node

#todo
#grab all potential shapes to spawn via a group/flag/filter on ready

@export var shapesToSpawn: Array[PackedScene] = [];
@export var world:Node;
@export var SPAWN_RATE: float = 3 :
	set(value):
		SPAWN_RATE = value
		$Timer.wait_time = SPAWN_RATE


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Timer.wait_time = SPAWN_RATE
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func spawnShape():
	#todo
	#determine / select shape to spawn
		#select a random resource color
		#and a random resource shape
	#determine spawning type
	#add random direction / velocity on certain shape spawning types

	var xPos = randf_range(0, get_viewport().size[0])
	var yPos = 0;
	
	var shapeToSpawn = shapesToSpawn[randi_range(0, shapesToSpawn.size() - 1)];

	var shapeInstance = shapeToSpawn.instantiate()
	shapeInstance.position = Vector2(xPos, yPos);
	
	var colors = [Color(1, 0, 0), Color(0, 1, 0), Color(0, 0, 1)];
	
	var sprite2d = shapeInstance.find_child("Sprite2D");
	sprite2d.set_modulate(colors[randi_range(0, colors.size() - 1)])
	world.add_child(shapeInstance)
	pass


func _on_timer_timeout() -> void:
	spawnShape();
	pass # Replace with function body.
