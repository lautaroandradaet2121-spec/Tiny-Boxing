class_name Luchador_clase extends CharacterBody2D


# Propiedades del lucahdor
@export var velocidad = 400
@export var vida = 100
@export var Posicion = Vector2(0,0)
@export var Mov_especial = false
@export var Estado = "Idle"
@export var Daño_golpe = 5
@export var Daño_especial = 20
@export var muerto = false

var Izq = ""
var Der = ""

#func cambiar_teclas(Izq_n, Der_n):
#	Izq = Izq_n
#	Der = Der_n

func pegar():
	pass
		
func defender():
	pass
	
func especial():
	pass

func cambiar_salud():
	pass
	
func detectar_estado():
	pass

	
func recoger_item():
	pass
	
func aplicar_efecto():
	pass
		
func morirse():
	if vida <= 0:
		muerto = true
	


func mover():
	var direccion = Input.get_axis(Izq, Der)
	
	#if direccion:
	velocity.x = direccion * velocidad
	#else:
	#	velocity = move_toward(velocity, 0, velocidad)
		
		
	#velocity = input_direction * speed

func _physics_process(delta):
	
	mover()
	move_and_slide()
