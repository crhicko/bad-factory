extends Node2D

@export var dropbox_component: Dropbox
@export var audio_player: AudioStreamPlayer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	dropbox_component.item_received.connect(_on_item_received)
	pass # Replace with function body.

func _on_item_received(target: Node, body: Node2D, mouse_pos: Vector2):
	audio_player.play()
	body.queue_free()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
