extends Node2D

const PreMeteoro = preload("res://Objetos/Meteoro.tscn")
var intervalo = 0

func _ready():
	set_process(true)
	pass
func _process(delta):
	
	if intervalo<0:
		randomize()
		var meteoro = PreMeteoro.instance()
		var x = rand_range(20,get_viewport_rect().end.x - 20)
		meteoro.set_pos(Vector2(x,-40))
		get_owner().add_child(meteoro)
		intervalo = rand_range(.2,1)
	intervalo-=delta
		
