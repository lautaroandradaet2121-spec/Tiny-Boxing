extends Sprite2D

var vida_ct = load("res://img/L2_vil.png")
var vida_at_1 = load("res://img/L2_vi1.png")
var vida_at_2 = load("res://img/L2_vi2.png")
var vida_at_3 = load("res://img/L2_vi4.png")
var vida_at_4 = load("res://img/L2_vi5.png")
var vida_at_5 = load("res://img/L2_vi3.png")
var vida_at_6 = load("res://img/L2_vi6.png")
var vida_at_7 = load("res://img/L2_vi7.png")
var vida_at_8 = load("res://img/L2_vi9.png")
var vida_at_9 = load("res://img/L2_vi10.png")
var vida_bt = load("res://img/L2_vib.png")

func algo():
	var luchador = get_tree().get_nodes_in_group("jugador2")
	for lucha_1 in luchador:
		var vida_actual= lucha_1.vida
		print("La vida del enemigo es: ", vida_actual)
		
		if vida_actual == 10:
			texture = vida_ct
			
		if vida_actual == 9:
			texture = vida_at_1
		
		if vida_actual == 8:
			texture = vida_at_2
			
		if vida_actual == 7:
			texture = vida_at_3
			
		if vida_actual == 6:
			texture = vida_at_4
		
		if vida_actual == 5:
			texture = vida_at_5
			
		if vida_actual == 4:
			texture = vida_at_6
			
		if vida_actual == 3:
			texture = vida_at_7
			
		if vida_actual == 2:
			texture = vida_at_8
			
		if vida_actual == 1:
			texture = vida_at_9
			
		if vida_actual <= 0:
			texture = vida_bt
			
					 
		
func _process(delta: float) -> void:
	algo()
