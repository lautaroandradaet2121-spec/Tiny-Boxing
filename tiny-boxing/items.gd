class_name items extends RigidBody2D
@onready var eliminador = $eliminacion_items/StaticBody2D
#const eliminador_path = preload("res://eliminacion_items.tscn")
@onready var items_el = $eliminacion_items2D

@export var posision = Vector2(0, 0)

func _physics_process(delta: float) -> void:
	var item_col = $RayCast2D
	var item_a_eliminar = $items
	if item_col.is_colliding():
		print("Esta colisionando con ", item_col.get_collider())
		if item_col.get_collider() == eliminador:
			print("Si colisiono")
			remove_child(item_a_eliminar)
