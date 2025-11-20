class_name items extends RigidBody2D

func accion(body):
	pass

func _ready() -> void:
	#self.body_entered.connect(_on_body_entered)
	self.body_entered.connect(func(body):
		if body.is_in_group("jugador"):
			self.accion(body)
			self.queue_free()
		)

#func _on_body_entered(body: Node2D):
#	print("colisiona")
		
#	if body.is_in_group("jugador"):
#		self.accion(body)
#		self.queue_free()
		
func _physics_process(delta: float) -> void:
	if position.y >= 700:
		self.queue_free()
	
	
