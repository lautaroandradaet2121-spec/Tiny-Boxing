extends Node
const item_1 = preload("res://items.tscn")
const item_2 = preload("res://item_vi.tscn")
const item_3 = preload("res://item_especial.tscn")
@onready var eliminador = $Node2D/StaticBody2D
@onready var J1 = $Jugador_1
@onready var J2 = $Jugador_2
@onready var audio = $AudioStreamPlayer2D


# contador
var segundos : float
var tiempoRestante : float
var loopTimer : bool

func crear_item():
	var eleccion = randi_range(0,9)
	
	if eleccion >= 0 and eleccion <= 4:
		var nuevo_item = item_1.instantiate()
	
		var posicion_x = randi_range(200, 950)
	
		nuevo_item.position = Vector2(posicion_x, -10)
	
		add_child(nuevo_item)
	if eleccion > 4 and eleccion <= 8:
		var nuevo_item = item_2.instantiate()
	
		var posicion_x = randi_range(200, 950)
	
		nuevo_item.position = Vector2(posicion_x, -10)
	
		add_child(nuevo_item)
		
	if eleccion == 9:
		
		var nuevo_item = item_3.instantiate()
	
		var posicion_x = randi_range(200, 950)
	
		nuevo_item.position = Vector2(posicion_x, -10)
	
		add_child(nuevo_item)
		

func Timer_crear_items(delta):
	
	tiempoRestante -= delta
	if tiempoRestante <= 0:
		if loopTimer:
			tiempoRestante = segundos
			crear_item()
		
	
	
func _ready() -> void:
	loopTimer = true
	segundos = 3
	
#	print (eliminador)	


func _process(delta: float) -> void:
		
	
	if audio.playing == false:
		audio.play()
	Timer_crear_items(delta)	
	if Input.is_action_just_pressed("Restart"):
		get_tree().change_scene_to_file("res://menu.tscn")
#		get_tree().reload_current_scene()


	
