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
	
