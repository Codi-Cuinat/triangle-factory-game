extends PathFollow2D

var speed = 0.3

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	progress_ratio += delta * speed
	
# This method will be called to destroy the piece
func _on_timeout():
	queue_free()  # This will remove the piece from the scene
