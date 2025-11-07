extends CharacterBody2D

func _physics_process(delta):
	velocity.x = 300

	var colision = move_and_collide(velocity * delta)
	if colision:
		var colisionador = colision.get_collider()
		
		if colisionador is J2:
			colisionador.recibir_dano(3, true)
			queue_free()
			
	
