extends Node


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	get_viewport().set_physics_object_picking_first_only(true)
	get_viewport().set_physics_object_picking_sort(true)


	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
#func drop(body: Node2D, mouse_pos: Vector2) -> void:
	#add_child(body)
	#body.position = mouse_pos
