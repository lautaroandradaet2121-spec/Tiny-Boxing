extends Luchador_clase
@onready var animacion = $AnimatedSprite2D
func _ready() -> void:
	Izq = "Izq_2"
	Der = "Der_2"
	golpe = "Atk_2"
	defensa = "Block_2"
	animacion.play("idle")

#var segundos : float
#var tiempoRestante = 0.3

func _physics_process(delta):
	
		
		
	if Estado != "defendiendo" and Estado != "atacando":
		
		mover()
		
		if Input.is_action_just_pressed(golpe):
			Estado = "atacando"
			animacion.play("atk")
			await get_tree().create_timer(0.3).timeout
			self.pegar()
			await get_tree().create_timer(1).timeout
			Estado = "Idle"
		
		if Input.is_action_just_pressed(Izq) or Input.is_action_just_pressed(Der) :
			animacion.play("move")
		if Input.is_action_just_released(Der) or Input.is_action_just_released(Izq):
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
		
