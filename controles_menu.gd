extends Node2D
@onready var audio = $AudioStreamPlayer2D
func _physics_process(delta: float) -> void:
	if audio.playing == false:
		audio.play()
		
	if Input.is_action_just_pressed("Escape"):
		get_tree().change_scene_to_file("res://menu.tscn")
