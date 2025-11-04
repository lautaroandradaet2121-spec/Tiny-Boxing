class_name Luchador_clase extends CharacterBody2D

const puno1 = preload("res://puno_1.tscn")
const puno2 = preload("res://puno_2.tscn")
# Propiedades del lucahdor
@export var velocidad = 400
@export var vida = 10
@export var Posicion = Vector2(0,0)
@export var Mov_especial = false
@export var Estado = "Idle"
@export var Dano_golpe = 1
@export var Dano_especial = 2
@export var muerto = false
@onready var golpes = 0

var Izq = ""
var Der = ""
var golpe = ""
var defensa = ""

#func cambiar_teclas(Izq_n, Der_n):
#	Izq = Izq_n
#	Der = Der_n

func pegar():
	golpes += 1
	print(Dano_golpe)
	print(position)
	print(global_position)
	
	if Estado != "defendiendo" and golpes <= 1:
		
		if golpe == "Atk_1":
			print("creando golpe")
			var nuevo_golpe = puno1.instantiate()
		#print(textura.texture)
		#textura.texture = imagen_temporal

			nuevo_golpe.position = Vector2(-10,0)
			print(nuevo_golpe.position)
	
		#get_parent().add_child(nuevo_golpe)
			if Estado == "atacando":
				add_child(nuevo_golpe)
			
		if golpe == "Atk_2":
			var nuevo_golpe = puno2.instantiate()

			nuevo_golpe.position = Vector2(-20,0)
			if Estado == "atacando":
				add_child(nuevo_golpe)
		
		
		
		
	await get_tree().create_timer(0.4).timeout
	Dano_golpe = 1
	print(Dano_golpe)
	golpes = 0
		
	
	
func defender():
	Estado = "defendiendo"
	velocity.x = 0

	
	
func especial():
	pass

func cambiar_salud():
	pass
	
func detectar_estado():
	pass

	
	
func aplicar_efecto():
	pass
		
func morirse():
	if vida <= 0:
		muerto = true
	

func recibir_dano(dano):
	if Estado != "defendiendo":
		vida -= dano

func mover():
	var direccion = Input.get_axis(Izq, Der)
	
	#if direccion:
	velocity.x = direccion * velocidad
	#else:
	#	velocity = move_toward(velocity, 0, velocidad)
		
		
	#velocity = input_direction * speed
