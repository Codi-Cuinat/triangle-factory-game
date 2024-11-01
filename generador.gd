extends Node2D

@export var piece_scene: Array[PackedScene]


func spawn_piece():
	var piece = piece_scene[0].instantiate() as Piece
	# Accede al Path2D de cinta
	piece.external_path = $"Cinta/Cinta int/Path2D"

	$"Cinta/Cinta int".add_child(piece)
	

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#spawn_piece()
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	spawn_piece()
	pass

func _on_timer_timeout() -> void:
	#spawn_piece()
	pass
