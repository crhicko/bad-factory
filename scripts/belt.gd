extends Node2D


var on_belt: Array = []
@export var BELT_SPEED: int = 1

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	for obj in on_belt:
		obj.position.x += BELT_SPEED
	pass

func is_droppable() -> bool:
	return true;
	
## mouse_pos is in global coordinates
func drop(body: Node2D, mouse_pos: Vector2) -> void:
	self.add_child(body)
	body.position = Vector2(mouse_pos.x - global_position.x, 0)
	if !on_belt.has(body):
		on_belt.append(body)


func _on_end_zone_area_entered(area: Area2D) -> void:
	print_debug("Endzone entered")


func _on_end_zone_body_entered(body: Node2D) -> void:
	print_debug("Body entered endzone")
	if on_belt.has(body):
		on_belt.remove_at(on_belt.find(body))
		body.die()
