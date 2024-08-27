extends Node2D

@export var dropbox_component: Dropbox
@export var success_audio_player: AudioStreamPlayer

var on_belt: Array = []
@export var BELT_SPEED: int = 1

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	dropbox_component.item_received.connect(_on_item_received)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	for obj in on_belt:
		obj.position.x += BELT_SPEED
	pass

	
## mouse_pos is in global coordinates
func _on_item_received(area: Dropbox, body: Node2D, mouse_pos: Vector2) -> void:
	if area.parent_node == self:
		body.get_parent().remove_child(body)
		self.add_child(body)
		body.position = Vector2(mouse_pos.x - global_position.x, 0)
		area.parent_node.z_index = 1
		body.set_collision_layer_value(1, false)
		if !on_belt.has(body):
			on_belt.append(body)
			body.died.connect(_on_body_died)
		
	elif on_belt.has(body):
		on_belt.remove_at(on_belt.find(body))

func _on_body_died(body, amount: int):
	if on_belt.has(body):
		on_belt.remove_at(on_belt.find(body))

func _on_end_zone_area_entered(area: Area2D) -> void:
	print_debug("Endzone entered")
	var body: Node2D = area.get_parent()
	if on_belt.has(body):
		on_belt.remove_at(on_belt.find(body))
		success_audio_player.play()
		body.die(20)

	
