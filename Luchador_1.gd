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
	if Estado != "defendiendo" and Estado != "atacando" and Mov_especial == true:
			
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
	
func _physics_process(delta):
	
	if recibe_dano == true:
		sonido.play()
		recibe_dano = false
	
	if Estado != "ganado":
		ganado_pelea()
		

		
	morirse()
	
	
	
	recarga_esp()
	if Estado != "defendiendo" and Estado != "atacando" and Estado != "especial" and Estado != "ganado":
		
		mover()
		
		
			
		if Input.is_action_just_pressed(golpe):
			Estado = "atacando"
			animacion.play("atk")
			await get_tree().create_timer(0.3).timeout
			self.pegar()
			
			await get_tree().create_timer(1).timeout
			print(Estado)
			if Estado != "ganado":
				Estado = "Idle"
				
		if velocity.x != 0:
			animacion.play("move")
		if velocity.x == 0:
			if Estado != "ganado":
				animacion.play("idle")
				Estado = "Idle"
			
		if Input.is_action_just_pressed(especial) and Mov_especial == true:
			self.especial_atk()
	
	if Estado != "ganado":		
		move_and_slide()
	
		if Estado == "atacando" or Estado == "especial":
			velocity.x = 0
		
		if Input.is_action_just_pressed(defensa):
			animacion.play("def")
			self.defender()
		
		if Input.is_action_just_released(defensa):
			animacion.play("idle")
			Estado = "Idle"
		
