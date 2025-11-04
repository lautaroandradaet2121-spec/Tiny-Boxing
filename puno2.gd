extends punos

func _ready() -> void:
	jug_1 = "jugador2"
	jug_2 = "jugador1"
	self.body_entered.connect(_on_body_entered)
	await get_tree().create_timer(0.3).timeout
	queue_free()
