extends Node2D
class_name Piece

signal collide

@export var nom: String;
@export var speed = 0.3

func _process(delta: float) -> void:
	$Path2D/PathFollow2D.progress_ratio += delta * speed


func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.is_in_group("machine"):
		collide.emit()
		queue_free()
