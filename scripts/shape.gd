extends RigidBody2D

var is_dragging: bool = false

var droppable_target: Node2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if is_dragging:
		global_position = get_viewport().get_mouse_position() + Vector2(0, $Sprite2D.texture.get_size().y / 3)


func _on_click_box_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		if event.is_pressed():
			is_dragging = true
		else:
			is_dragging = false
			##make sure we have a target to drop it into
			if droppable_target != null:
				drop_in(droppable_target, event.global_position)
			else:
				pass  ##do whatever we do when not dropping on to an active square (do physics?)
			print("done dragging")

func drop_in(target: Node2D, mouse_pos: Vector2):
	get_parent().remove_child(self)
	target.drop(self, mouse_pos)

func _on_click_box_area_entered(area: Area2D) -> void:
	if area.is_in_group("droppable"):
		print_debug("its droppable")
		droppable_target = area.get_parent()

func _on_click_box_area_exited(area: Area2D) -> void:
	if area.is_in_group("droppable"):
		print_debug("its not droppable anymore")
		droppable_target = null
		
func die():
	print("IM DYING OVA HERE")
	queue_free()
