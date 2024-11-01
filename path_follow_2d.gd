extends PathFollow2D

var speed = 0.3

func _ready() -> void:
	progress_ratio = 0;
	pass
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	progress_ratio += delta * speed
	pass
	
# This method will be called to destroy the piece
func _on_timeout():
	queue_free()  # This will remove the piece from the scene
