class_name item_vi extends items 

#var objetos_ju_1 = get_tree().get_node_count_in_group("jugador1")
func accion(body):
	body.vida += 1
	
	if body.vida > 10:
		
		body.vida = 10
		
