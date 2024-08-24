extends RigidBody2D

var is_dragging: bool = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if is_dragging:
		position = get_viewport().get_mouse_position() + Vector2(0, $Sprite2D.texture.get_size().y/2)
	
	pass


func _on_click_box_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		if event.is_pressed():
			is_dragging = true
			print("dragging") 
		else:
			is_dragging = false
			print("done dragging")
