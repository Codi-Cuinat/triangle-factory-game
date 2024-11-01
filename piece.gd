extends Node2D
class_name Piece

@export var nom: String;
@export var speed = 50
@export var external_path: Path2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print("??")
	if external_path:
		print("funcionas")
		_copy_path_points(external_path)

# Función para copiar puntos de otro Path2D
func _copy_path_points(source_path: Path2D):
	var curve = source_path.curve
	$Path2D.curve = curve.duplicate()  # Copia la curva completa al Path2D de Piece
