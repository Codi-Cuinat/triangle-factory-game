extends Node2D

@export var piece_scene: Array[PackedScene]


func spawn_piece():
	var p = piece_scene[0].instantiate()
	var path_follow = PathFollow2D.new()
	
	# Attach the script to path_follow
	path_follow.script = load("res://path_follow_2d.gd")
	
	# Add the PathFollow2D to the Path2D and add the piece to the PathFollow2D
	$"Cinta/Cinta int/Path2D".add_child(path_follow)
	path_follow.add_child(p)
	

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#spawn_piece()
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

func _on_timer_timeout() -> void:
	print("maskfjasdlf")
	spawn_piece()
