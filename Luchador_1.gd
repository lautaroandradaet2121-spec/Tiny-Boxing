class_name J1 extends Luchador_clase
@onready var animacion = $sprite_j1
const especial1 = preload("res://especial_j1.tscn")
@onready var sonido = $"../AudioStreamPlayer"
func _ready() -> void:
	Izq = "Izq_1"
	Der = "Der_1"
	golpe = "Atk_1"
	defensa = "Block_1"
	especial = "Esp_1"
	animacion.play("idle")

func especial_atk():
	
	Estado = "especial"
	if Mov_especial == true:
			
		animacion.play("atk")
		
		var nuevo_especial = especial1.instantiate()
		nuevo_especial.position = Vector2(global_position.x +10,global_position.y -50)
		if Estado != "atacando":
			await get_tree().create_timer(0.4).timeout
			get_parent().add_child(nuevo_especial)
			velocity.x = 0
			Mov_especial = false
	await get_tree().create_timer(1).timeout
	if Estado != "ganado":
		Estado = "idle"
	
	
func ganado_pelea():
	var luchador = get_tree().get_nodes_in_group("jugador2")
	for lucha_1 in luchador:
		var vida_actual= lucha_1.muerto
		if vida_actual == true:
			velocity.x = 0
			Estado = "ganado"
			animacion.play("gan")
			

func animaciones():
	if Estado == "atacando" and contador_ani == 0:
		animacion.play("atk")
		contador_ani = 1
		await get_tree().create_timer(1.5).timeout
		contador_ani = 0
			
	if velocity.x != 0:
		animacion.play("move")
	
	if Estado != "atacando" and Estado != "especial":
		if velocity.x == 0:
			if Estado != "ganado":
				animacion.play("idle")
			
	
	

	if Estado == "defendiendo":
		animacion.play("def")

	
func _physics_process(delta):
	if recibe_dano == true:
		sonido.play()
		recibe_dano = false
	
	if Estado != "ganado":
		ganado_pelea()
		
	
	morirse()
	
	recarga_esp()
	if Estado != "defendiendo" and Estado != "atacando" and Estado != "especial" and Estado != "ganado":
		if Input.is_action_just_pressed(especial) and Mov_especial == true:
			self.especial_atk()
			animacion.play("atk")
	
	controles()
	animaciones()
