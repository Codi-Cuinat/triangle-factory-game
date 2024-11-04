extends Node2D

class_name Countdown

var piece_count = 50

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _decrease_piece_count():
	piece_count -= 1
	$Label.text = str(piece_count)

func _increase_piece_count(num: int):
	piece_count += num
	$Label.text = str(piece_count)
