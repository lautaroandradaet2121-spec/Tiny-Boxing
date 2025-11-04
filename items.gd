class_name items extends RigidBody2D
@export var posision = Vector2(0, 0)




func _physics_process(delta: float) -> void:
	if position.y >= 700:
		self.queue_free()
