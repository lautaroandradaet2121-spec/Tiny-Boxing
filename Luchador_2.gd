class_name J2 extends Luchador_clase
@onready var animacion = $sprite_j2
const especial2 = preload("res://especial_j2.tscn")


func _ready() -> void:
	Izq = "Izq_2"
	Der = "Der_2"
	golpe = "Atk_2"
	defensa = "Block_2"
	especial = "Esp_2"
	animacion.play("idle")

#var segundos : float
#var tiempoRestante = 0.3

func especial_atk():
	
	Estado = "especial"
	if Estado != "defendiendo" and Estado != "atacando" and Mov_especial == true:
			
		animacion.play("atk")
		
		var nuevo_especial = especial2.instantiate()
		nuevo_especial.position = Vector2(global_position.x -100,global_position.y -50)
		if Estado != "atacando":
			await get_tree().create_timer(0.4).timeout
			get_parent().add_child(nuevo_especial)
			velocity.x = 0
			Mov_especial = false
	await get_tree().create_timer(1).timeout
	if Estado != "ganado":
		Estado = "idle"
	
func ganado_pelea():
	var luchador = get_tree().get_nodes_in_group("jugador1")
	for lucha_2 in luchador:
		var vida_actual= lucha_2.muerto
		if vida_actual == true:
			velocity.x = 0
			Estado = "ganado"
			animacion.play("gan")
	
func _physics_process(delta):
	
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
			
	move_and_slide()
	
	if Estado == "atacando" or Estado == "especial":
		velocity.x = 0
	
	if Estado != "ganado":
		if Input.is_action_just_pressed(defensa):
			animacion.play("def")
			self.defender()
		
		if Input.is_action_just_released(defensa):
			animacion.play("idle")
			Estado = "Idle"
		
