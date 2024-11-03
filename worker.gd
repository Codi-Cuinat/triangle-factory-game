extends Node2D

@onready var status_label: Label = $Label # Nodo Label para mostrar el estado

const WORKER_BY_LVL = {
	0: {
		"sentence": "man what the fuck",
		"texture": preload("res://Assets/Worker Tired.png")
	},
	1: {
		"sentence": "a circle?? in the triangle factory?? how queer!!\nive never seen such a thing- i must inquire about\n this further with my supervisor post-hastel!!",
		"texture": preload("res://Assets/Worker Good.png")
		
	},
	2: {
		"sentence": "i guess we doing circles now",
		"texture": preload("res://Assets/Worker Guess.png")
	}
}

var default_texture: Texture;
var experience_level: int = 2

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	default_texture = $Sprite2D.texture
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

# Llamada cuando aparece una pieza inesperada
func handle_unexpected_piece():
	update_texture(WORKER_BY_LVL[experience_level].texture)
	update_status_label(WORKER_BY_LVL[experience_level].sentence)
	# Espeera 3 segons i reinica estats inicials
	await get_tree().create_timer(3).timeout
	update_status_label("")
	update_texture(default_texture)


func update_status_label(message: String) -> void:
	status_label.text = message
	
func update_texture(texture: Texture):
	$Sprite2D.texture = texture
