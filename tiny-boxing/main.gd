extends Node
const item_1 = preload("res://items.tscn")
@onready var eliminador = $eliminacion_items/StaticBody2D

func crear_item():
	var nuevo_item = item_1.instantiate()
	
	var posicion_x = randi() % 1160 
	
	nuevo_item.position = Vector2(posicion_x, -10)
	
	add_child(nuevo_item)

func _process(delta: float) -> void:
	
	crear_item()
	
func _ready() -> void:
	pass
#	print (eliminador)	
	
