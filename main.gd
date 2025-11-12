extends Node
const item_1 = preload("res://items.tscn")
const item_2 = preload("res://item_vi.tscn")
@onready var eliminador = $Node2D/StaticBody2D

# contador
var segundos : float
var tiempoRestante : float
var loopTimer : bool

func crear_item():
	var eleccion = randi_range(0,1)
	
	if eleccion == 0:
		var nuevo_item = item_1.instantiate()
	
		var posicion_x = randi_range(200, 950)
	
		nuevo_item.position = Vector2(posicion_x, -10)
	
		add_child(nuevo_item)
	else:
		var nuevo_item = item_2.instantiate()
	
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
	Timer_crear_items(delta)	
		
	#await get_tree().create_timer(9.0).timeout
	#crear_item()
	#crear_item()

	
