extends items 

#var objetos_ju_1 = get_tree().get_node_count_in_group("jugador1")

func _ready() -> void:
	self.body_entered.connect(_on_body_entered)

func _on_body_entered(body: Node2D):
	print("colisiona")
		
	if body.is_in_group("jugador1") or body.is_in_group("jugador2"):
		print("Colisión con un objeto ", body)
		body.vida += 1
	
	if body.vida > 10:
		
		body.vida = 10
			
		
		print(body.vida)
	self.queue_free()
		
	
		
