extends CharacterBody2D

func _ready() -> void:
	velocity.x = -1000
	

func _process(delta: float) -> void:
	move_and_slide()
	if position.x == -2000:
		self.queue_free()
