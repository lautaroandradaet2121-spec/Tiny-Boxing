extends GdUnitTestSuite

func test_golpe_j1():
	var correr := scene_runner("res://esportio.tscn")
	
	var jugador2:CharacterBody2D = correr.find_child("Jugador_2")
	correr.simulate_key_press(KEY_D)
	await await_millis(2000)
	correr.simulate_key_release(KEY_D)
	await await_millis(500)
	
	var vida_ini = jugador2.vida
	
	correr.simulate_key_press(KEY_B)
	await await_millis(500)
	correr.simulate_key_release(KEY_B)
	await await_millis(500)
	
	var vida_fin = jugador2.vida
	
	assert_int(vida_fin).is_less(vida_ini)
	


#------------------------------------------------------------------------------------

	
func test_golpe_j2():
	var correr := scene_runner("res://esportio.tscn")
	
	var jugador1:CharacterBody2D = correr.find_child("Jugador_1")
	correr.simulate_key_press(KEY_LEFT)
	await await_millis(2000)
	correr.simulate_key_release(KEY_LEFT)
	await await_millis(500)
	
	var vida_ini = jugador1.vida
	
	correr.simulate_key_press(KEY_O)
	await await_millis(500)
	correr.simulate_key_release(KEY_O)
	await await_millis(500)
	
	var vida_fin = jugador1.vida
	
	assert_int(vida_fin).is_less(vida_ini)


#---------------------------------------------------------------------------------------


func test_golpe_especialj1():
	var correr := scene_runner("res://esportio.tscn")
	
	var jugador2:CharacterBody2D = correr.find_child("Jugador_2")
	
	var vida_ini = jugador2.vida
	
	await await_millis(20000)
	correr.simulate_key_press(KEY_N)
	await await_millis(3000)
	
	var vida_fin = jugador2.vida

	assert_int(vida_fin).is_less(vida_ini)

#---------------------------------------------------------------------------------------


func test_golpe_especialj2():
	var correr := scene_runner("res://esportio.tscn")
	
	var jugador1:CharacterBody2D = correr.find_child("Jugador_1")
	
	var vida_ini = jugador1.vida
	
	await await_millis(20000)
	correr.simulate_key_press(KEY_P)
	await await_millis(3000)
	
	var vida_fin = jugador1.vida

	assert_int(vida_fin).is_less(vida_ini)
	
#-----------------------------------------------------------------------------------
