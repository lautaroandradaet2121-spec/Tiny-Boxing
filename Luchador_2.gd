class_name J2 extends Luchador_clase
@onready var animacion = $AnimatedSprite2D
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
		
			
		var nuevo_especial = especial2.instantiate()
		nuevo_especial.position = Vector2(-100,-50)
		if Estado != "atacando":
			add_child(nuevo_especial)
			
			
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
		
