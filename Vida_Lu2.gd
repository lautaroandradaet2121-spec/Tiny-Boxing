extends TextureProgressBar

#const imagen_atk_2_j2 = preload("res://img/js animations/j2/atk_2_j2.png")
var barra_ver = load("res://img/color_barra.png")
var barra_ama = load("res://img/barra_vida_ama.png")
var barra_roj = load("res://img/barra_vida_roj.png")
#func _ready() -> void:
#	texture = imagen_atk_2_j2

func actualizar_barra():
	var luchador = get_tree().get_nodes_in_group("jugador1")
	for lucha in luchador:
		if lucha.vida > 5:
			self.texture_progress = barra_ver
		
		if lucha.vida <= 5 and lucha.vida > 2:
			self.texture_progress = barra_ama
		
		if lucha.vida <= 2:
			self.texture_progress = barra_roj
			
			
		if lucha.vida >= 0:
			self.value = lucha.vida
		if lucha.vida <= 0:
			self.value = 0
		
		
		#print("La vida del enemigo es: ", vida_actual)
			
					 
		
func _process(delta: float) -> void:
	actualizar_barra()
