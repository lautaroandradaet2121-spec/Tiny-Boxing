extends GdUnitTestSuite

func test_derechaj1():
	
	var correr := scene_runner("res://esportio.tscn")
	
	var jugador:CharacterBody2D = correr.find_child("Jugador_1")
	
	var inicio:Vector2 = jugador.global_position
	
	correr.simulate_key_press(KEY_D)
	await await_millis(1000)
	
	var posicion_final:Vector2 = jugador.global_position
	
	var movimiento = inicio.direction_to(posicion_final)
	
	assert_vector(movimiento).is_equal_approx(Vector2.RIGHT, Vector2(1, 1))
	
#----------------------------------------------------------------------------------
	
func test_izquierdaj1():
	var correr := scene_runner("res://esportio.tscn")
	
	var jugador:CharacterBody2D = correr.find_child("Jugador_1")
	
	var inicio:Vector2 = jugador.global_position
	
	correr.simulate_key_press(KEY_A)
	await await_millis(1000)
	
	var posicion_final:Vector2 = jugador.global_position
	
	var movimiento = inicio.direction_to(posicion_final)
	
	assert_vector(movimiento).is_equal_approx(Vector2.LEFT, Vector2(1, 1))

#---------------------------------------------------------------------------------
	
func test_derechaj2():
	
	var correr := scene_runner("res://esportio.tscn")
	
	var jugador:CharacterBody2D = correr.find_child("Jugador_2")
	
	var inicio:Vector2 = jugador.global_position
	
	correr.simulate_key_press(KEY_RIGHT)
	await await_millis(1000)
	
	var posicion_final:Vector2 = jugador.global_position
	
	var movimiento = inicio.direction_to(posicion_final)
	
	assert_vector(movimiento).is_equal_approx(Vector2.RIGHT, Vector2(1, 1))
	
#----------------------------------------------------------------------------------
	
func test_izquierdaj2():
	var correr := scene_runner("res://esportio.tscn")
	
	var jugador:CharacterBody2D = correr.find_child("Jugador_2")
	
	var inicio:Vector2 = jugador.global_position
	
	correr.simulate_key_press(KEY_LEFT)
	await await_millis(1000)
	
	var posicion_final:Vector2 = jugador.global_position
	
	var movimiento = inicio.direction_to(posicion_final)
	
	assert_vector(movimiento).is_equal_approx(Vector2.LEFT, Vector2(1, 1))
	
#--------------------------------------------------------------------------------------
