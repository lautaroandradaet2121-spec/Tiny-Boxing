extends Node
const item_1 = preload("res://items.tscn")
const item_2 = preload("res://item_vi.tscn")
const item_3 = preload("res://item_especial.tscn")
const gato_egg = preload("res://gato_egg.tscn")
var contador_egg = 0
@onready var audio = $AudioStreamPlayer2D
@onready var audio_miau = $miau


# contador
var segundos : float
var tiempoRestante : float

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

		tiempoRestante = segundos
		crear_item()

func easter_egg():
	
	if Input.is_key_pressed(KEY_G) and Input.is_key_pressed(KEY_A) and Input.is_key_pressed(KEY_T) and Input.is_key_pressed(KEY_O) and contador_egg == 0:
		contador_egg = 1
		var gato_eggs = gato_egg.instantiate()
		gato_eggs.position = Vector2(1300, 300)
		add_child(gato_eggs)
		audio_miau.play()
		
		await get_tree().create_timer(3).timeout
		
		contador_egg = 0
	
func _ready() -> void:
	segundos = 3
	
#	print (eliminador)	


func _process(delta: float) -> void:
		
	easter_egg()
	if audio.playing == false:
		audio.play()
	var luchador = get_tree().get_nodes_in_group("jugador")
	for lucha in luchador:
		if lucha.Estado != "ganado":
			Timer_crear_items(delta)	

	if Input.is_action_just_pressed("Restart"):
		get_tree().change_scene_to_file("res://menu.tscn")
#		get_tree().reload_current_scene()


	
