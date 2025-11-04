class_name punos extends RigidBody2D
@onready var dano = 0
@onready var jug_1 = "jugador1"
@onready var jug_2 = "jugador2"

var segundos : float
var tiempoRestante = 0.1

func _process(delta: float) -> void:
	tiempoRestante -= delta
	if tiempoRestante <= 0:
		queue_free()

func _ready() -> void:
	
	self.body_entered.connect(_on_body_entered)

	#await get_tree().create_timer(0.3).timeout
	#queue_free()
	
	



func _on_body_entered(body: Node2D):
	print("puno colisiona")
	
	if body.is_in_group(jug_1):
		dano = body.Dano_golpe
		print("dano de goloe: ", dano)
		
	
	
	if body.is_in_group(jug_2):
		print("Puno colisiona con J2 ", body)
		
		print("Vida J2: ", body.vida)
		body.recibir_dano(dano)
		
		print("Vida J2 tras golpear: ", body.vida)
		self.queue_free()
		
		
		
	
		
