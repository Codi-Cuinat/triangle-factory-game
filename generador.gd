extends Node2D

@export var spawn_point: Vector2
@export var piece_scene: Array[PackedScene]


func spawn_piece():
	var p = piece_scene[0].instantiate()
	$PiecesGroup.add_child(p)
	p.position = spawn_point
	

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	spawn_piece()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
