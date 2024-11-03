extends Node2D

@onready var status_label: Label = $Label # Nodo Label para mostrar el estado

const GOOD_WORKER_SAYS = "a circle?? in the triangle factory?? how queer!! ive never seen such a thing- i must inquire about this further with my supervisor post-hastel!!"
const BAD_WORKER_SAYS = "i guess we doing circles now"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

# Llamada cuando aparece una pieza inesperada
func handle_unexpected_piece():
	# Decide entre notificar al supervisor o ignorar
	if should_notify_supervisor():
		notify_supervisor()
	else:
		ignore_unexpected_piece()

# Decisión aleatoria o basada en algún criterio para notificar
func should_notify_supervisor() -> bool:
	# Aquí puedes usar una probabilidad o una lógica específica
	return randf() < 0.5 # 50% de probabilidad de notificar al supervisor

# Acción de notificar al supervisor
func notify_supervisor():
	print("Notificando al supervisor: ¡pieza inesperada detectada!")
	update_status_label(GOOD_WORKER_SAYS)

# Acción de ignorar la pieza inesperada
func ignore_unexpected_piece():
	print("Ignorando la pieza inesperada.")
	update_status_label(BAD_WORKER_SAYS)
	
	# Actualiza el texto del label y lo muestra por un breve periodo
func update_status_label(message: String) -> void:
	status_label.text = message
	status_label.visible = true
	await get_tree().create_timer(1.5).timeout # Muestra el mensaje por 1.5 segundos
	status_label.visible = false
