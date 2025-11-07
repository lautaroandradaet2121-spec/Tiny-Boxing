class_name J1 extends Luchador_clase
@onready var animacion = $AnimatedSprite2D
const especial1 = preload("res://especial_j1.tscn")

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
		
			
		var nuevo_especial = especial1.instantiate()
		nuevo_especial.position = Vector2(10,-50)
		if Estado != "atacando":
			add_child(nuevo_especial)
	
		#get_parent().add_child(nuevo_golpe)
			#if Estado == "atacando":
#			add_child(nuevo_especial)

func _physics_process(delta):
	
		
		
	if Estado != "defendiendo" and Estado != "atacando" and Estado != "especial":
		
		mover()
		if Input.is_action_just_pressed(especial):
			self.especial_atk()
			
		if Input.is_action_just_pressed(golpe):
			Estado = "atacando"
			animacion.play("atk")
			await get_tree().create_timer(0.3).timeout
			self.pegar()
			await get_tree().create_timer(1).timeout
			
			Estado = "Idle"
		
		
		if velocity.x != 0:
			animacion.play("move")
		if velocity.x == 0:
			animacion.play("idle")
			Estado = "Idle"
				
	move_and_slide()
	
	if Estado == "atacando":
		velocity.x = 0
	
	
		
		
	if Input.is_action_just_pressed(defensa):
		animacion.play("def")
		self.defender()
		
	if Input.is_action_just_released(defensa):
		animacion.play("idle")
		Estado = "Idle"
		
