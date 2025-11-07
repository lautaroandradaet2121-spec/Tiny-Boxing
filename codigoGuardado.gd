# DEBUG ELIMINADOR COLISIONES E ITEMS

func _physics_process(delta: float) -> void:
	#var item_a_eliminar = $items
	#var item_contacto = eliminador_col.get_collider()
	
	
	if eliminador_col.is_colliding():
		print("Eliminador esta colisionando con ", eliminador_col.get_collider())
		#if eliminador_col.get_collider() == :
		#	print("Si colisiono")
			
			
	if item_col.is_colliding():
		print("Esta colisionando con ", item_col.get_collider())
		if item_col.get_collider() == eliminador:
			print("Si colisiono")
			#remove_child(eliminador_col.get_collider())




# ELIMINAR ITEM OLD
extends Node
const item_1 = preload("res://items.tscn")
@onready var eliminador = $eliminacion_items/StaticBody2D
@onready var item_col = $items/RigidBody2D/RayCast2D

func crear_item():
	
	var nuevo_item = item_1.instantiate()
	var posicion_x = randi() % 1160 
	
	nuevo_item.position = Vector2(posicion_x, -10)
	
	add_child(nuevo_item)

func _physics_process(delta: float) -> void:
	var item_a_eliminar = item_col
	if item_col.is_colliding():
		print("Esta colisionando con ", item_col.get_collider())
		if item_col.get_collider() == eliminador:
			print("Si colisiono")
			remove_child(item_a_eliminar)

func _process(delta: float) -> void:
	
	#rear_item()
	
func _ready() -> void:
	pass
#	print (eliminador)	
	
	 Para que esto funcione, DEBES conectar la señal 'body_entered'
 a la función _on_body_entered. Puedes hacerlo:
# a) Desde el editor (pestaña "Nodo" en el Inspector).
# b) Por código (en _ready, usando self.body_entered.connect(_on_body_entered)).
	if item_col.is_colliding():
		print("Esta colisionando con ", coll)
		if coll.get_instance_id() == eliminador.get_instance_id():
			self.queue_free()




# old collision for super

class_name especial_atk extends RigidBody2D
@onready var especial = false
@onready var jug_1 = "jugador1"
@onready var jug_2 = "jugador2"


func _process(delta: float) -> void:
	if position.x >= 700 or position.x <= -700:
		self.queue_free()
		
func _ready() -> void:
	
	self.body_entered.connect(_on_body_entered)

	#await get_tree().create_timer(0.3).timeout
	#queue_free()
	
	



func _on_body_entered(body: Node2D):
	print("especial colisiona")
	
	if body.is_in_group(jug_2):
		print("Especial colisiona con J2 ", body)
		
		print("Vida J2: ", body.vida)
		body.recibir_dano(2)
		
		
		print("Vida J2 tras especial: ", body.vida)
		self.queue_free()
