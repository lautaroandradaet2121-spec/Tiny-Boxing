class_name items extends RigidBody2D
@export var posision = Vector2(0, 0)

func _ready() -> void:
	self.body_entered.connect(_on_body_entered)

func _on_body_entered(body: Node2D):
	print("colisiona")
		
	if body.is_in_group("jugador1") or body.is_in_group("jugador2"):
		print("Colisión con un objeto 'jugador'.")
		self.queue_free()


func _physics_process(delta: float) -> void:
	if position.y >= 999:
		self.queue_free()
