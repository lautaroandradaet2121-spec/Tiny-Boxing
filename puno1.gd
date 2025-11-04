extends punos

func _ready() -> void:
	jug_1 = "jugador1"
	jug_2 = "jugador2"
	self.body_entered.connect(_on_body_entered)
	await get_tree().create_timer(0.3).timeout
	queue_free()
