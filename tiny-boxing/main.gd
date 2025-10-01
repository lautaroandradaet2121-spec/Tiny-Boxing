extends Node
const item_1 = preload("res://items.tscn")
@onready var eliminador = $eliminacion_items
func crear_item():
	var nuevo_item = item_1.instantiate()
	
	var posicion_x = randi() % 1160 
	
	nuevo_item.position = Vector2(posicion_x, -10)
	
	add_child(nuevo_item)
	
	
func _physics_process(delta: float) -> void:
	if eliminador.is_colliding():
		if eliminador.get_collider().name == "items":
			remove_child(eliminador.get_collider())


func _process(delta: float) -> void:
	crear_item()
	
	
