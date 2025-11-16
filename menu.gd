extends Node2D

var seleccion = 0
@onready var flecha = $FlechasSelect
@onready var audio = $AudioStreamPlayer2D

func _physics_process(delta: float) -> void:
	if audio.playing == false:
		audio.play()
	
	if seleccion == 0:
		flecha.position.y = 307
	if seleccion == 1:
		flecha.position.y = 530
	
	
	
	if Input.is_action_just_pressed("Abajo"):
		seleccion = 1
		
	if Input.is_action_just_pressed("Arriba"):
		seleccion = 0
		
	if seleccion == 0 and Input.is_action_just_pressed("Enter"):
		get_tree().change_scene_to_file("res://esportio.tscn")
		
	if seleccion == 1 and Input.is_action_just_pressed("Enter"):
		get_tree().change_scene_to_file("res://controles.tscn")
		
	
