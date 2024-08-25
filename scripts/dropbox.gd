extends Area2D
class_name Dropbox

@export var parent_node: Node

signal item_received(area, body, mouse_pos)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

##propagate to the actual belt node
func handle_drop(area: Area2D, body: Node2D, mouse_pos: Vector2) -> void:
	item_received.emit(area, body, mouse_pos)
	#parent_node.handle_drop(target, body, mouse_pos)
