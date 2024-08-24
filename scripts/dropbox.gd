extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

##propagate to the actual belt node
func handle_drop(target: Node, body: Node2D, mouse_pos: Vector2) -> void:
	get_parent().handle_drop(target, body, mouse_pos)
