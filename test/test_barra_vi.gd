extends GdUnitTestSuite

func test_vida_j1():
	var correr := scene_runner("res://esportio.tscn")
	
	var jugador1:CharacterBody2D = correr.find_child("Jugador_1")
	
	var barra_vida:Node2D = correr.find_child("barra_de_vida")
	var sprite_barra:Sprite2D = barra_vida.find_child("Sprite2D")
	
	var tex_ini = sprite_barra.texture
	await await_millis(3000)
	
	for i in range(0, 10):
		tex_ini = sprite_barra.texture
		jugador1.vida -= 1	
		await await_millis(2000)
		assert_that(tex_ini).is_not_equal(sprite_barra.texture)
		
#-----------------------------------------------------------------------------------

func test_vida_j2():
	var correr := scene_runner("res://esportio.tscn")
	
	var jugador1:CharacterBody2D = correr.find_child("Jugador_2")
	
	var barra_vida:Node2D = correr.find_child("barra_vida_j2")
	var sprite_barra:Sprite2D = barra_vida.find_child("Sprite2D")
	
	var tex_ini = sprite_barra.texture
	await await_millis(3000)
	
	for i in range(0, 10):
		tex_ini = sprite_barra.texture
		jugador1.vida -= 1	
		await await_millis(2000)
		assert_that(tex_ini).is_not_equal(sprite_barra.texture)
	
