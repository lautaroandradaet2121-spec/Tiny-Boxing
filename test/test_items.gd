extends GdUnitTestSuite
const item_1 = preload("res://items.tscn")
const item_2 = preload("res://item_vi.tscn")

func test_item_da():
	var correr := scene_runner("res://esportio.tscn")
	
	var jugador1:CharacterBody2D = correr.find_child("Jugador_1")

	var nuevo_item = item_1.instantiate()
	
	var posicion_x = jugador1.global_position.x 
	
	nuevo_item.position = Vector2(posicion_x, 10)
	
	#var escena:Node2D = correr.find_child("Node2D")
	
	add_child(nuevo_item)
	
	await await_millis(3000)
	
	assert_int(jugador1.Dano_golpe).is_greater(1)	
	
	await_millis(3000)
	
	correr.simulate_key_press(KEY_B)
	
	await await_millis(1000)
	
	assert_int(jugador1.Dano_golpe).is_less(2)
	
#-------------------------------------------------------------------------------------

func test_item_vi():
	
	var correr := scene_runner("res://esportio.tscn")
	
	var jugador1:CharacterBody2D = correr.find_child("Jugador_1")
	
	jugador1.vida = 9
	
	var vida_ini = jugador1.vida
	
	var nuevo_item = item_2.instantiate()
	
	var posicion_x = jugador1.global_position.x 
	
	nuevo_item.position = Vector2(posicion_x, 10)
	
	#var escena:Node2D = correr.find_child("Node2D")
	
	add_child(nuevo_item)
	
	await await_millis(3000)
	
	assert_int(jugador1.vida).is_greater(vida_ini)	
	
	
