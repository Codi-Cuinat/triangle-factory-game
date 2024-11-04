extends Node2D
class_name Worker

@onready var status_label: Label = $Label # Nodo Label para mostrar el estado

const WORKER_BY_LVL = {
	0: {
		"sentence": "man what the fuck",
		"texture": preload("res://Assets/Worker Tired.png"),
		"lvlUpReqExp": 2
	},
	1: {
		"sentence": "i guess we doing circles now",
		"texture": preload("res://Assets/Worker Guess.png"),
		"lvlUpReqExp": 3
	},
	2: {
		"sentence": "a circle?? in the triangle factory?? how queer!!\nive never seen such a thing- i must inquire about\n this further with my supervisor post-hastel!!",
		"texture": preload("res://Assets/Worker Good.png")
	}
}

var default_texture: Texture;
var level: int = 0;
var experience: int = 0;
var removed_unexpected_pieces: int = 0;

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	update_experience_label()
	default_texture = $Sprite2D.texture

# Llamada cuando aparece una pieza inesperada
func handle_unexpected_piece():
	#TODO: S'ha de millorar, surtiran bugs per temes de timmings, seria millor que mentre hi hagi
	# una unexpected piece surti el missatge, a la que desapareix aquesta desapareixi el missatge, i 
	# no fer-ho per temps
	$Sprite2D.texture = WORKER_BY_LVL[level].texture
	status_label.text = WORKER_BY_LVL[level].sentence
	# Espeera 3 segons i reinica estats inicials
	await get_tree().create_timer(3).timeout
	status_label.text = ""
	$Sprite2D.texture = default_texture

func _on_removed_unexpected_pieces() -> void:
	removed_unexpected_pieces += 1
	#if (removed_unexpected_pieces % 2 == 0): # Cada 2 peçes puja el lvl per debugar, shaura dincrementar una mica la expriencia
	increase_experience()
	
func increase_experience():
	experience += 1
	if can_level_up() and experience >= WORKER_BY_LVL[level].lvlUpReqExp:
		level += 1
	update_experience_label()


func update_experience_label():
	var nextRequiredExp = WORKER_BY_LVL[level].lvlUpReqExp if can_level_up() else -1
	$LabelExperience.text = str(experience) + "/" + str(nextRequiredExp)

func can_level_up():
	return "lvlUpReqExp" in WORKER_BY_LVL[level]
