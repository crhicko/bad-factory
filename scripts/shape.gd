extends RigidBody2D

var is_dragging: bool = false :
	set(value):
		is_dragging = value
		### move the dragged item to the front of rendering then revert that when dropping
		self.z_index = 10 if value == true else 1
		### remove collision from free shapes if dragging, add it back if not
		set_collision_layer_value(1, !value)

var droppable_target: Node2D

signal released(target, mouse_pos, node)

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
			print("grabbed:    ", self)
			is_dragging = true
		else:
			is_dragging = false
			#self.z_index = 1
			#set_collision_mask_value(1, true)
			drop_in(droppable_target, event.global_position)
			### Velocity is maintained from the belt so to stop it freaking out when dragging it off, reset its velocity
			if droppable_target == null:
				linear_velocity = Vector2.ZERO

func drop_in(target: Node, mouse_pos: Vector2):
	##Could also use the area 2d of the droppable object and check the exited signal
	get_tree().call_group("droppable", "handle_drop", target, self, mouse_pos)

func _on_click_box_area_entered(area: Area2D) -> void:
	if area.is_in_group("droppable"):
		#print_debug("its droppable")
		droppable_target = area.get_parent()

func _on_click_box_area_exited(area: Area2D) -> void:
	if area.is_in_group("droppable"):
		#print_debug("its not droppable anymore")
		droppable_target = null
		
func die():
	print("IM DYING OVA HERE")
	queue_free()
