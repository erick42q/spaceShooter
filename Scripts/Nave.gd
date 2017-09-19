extends Area2D
var arma
var vel = 300
var TiroSimples = preload("res://Scripts/classes/armas/TiroSimples.gd")
var TiroDuplo = preload("res://Scripts/classes/armas/TiroDuplo.gd")
var TiroRapido = preload("res://Scripts/classes/armas/TiroRapido.gd")

var armas = [
		TiroSimples.new(self),
		TiroRapido.new(self),
		TiroDuplo.new(self)
	]	

func _ready():
	set_process(true)
	arma = TiroSimples.new(self)
	add_to_group(Game.GROUP_NAVE)
	pass
	
func _process(delta):
	#movimentação
	var d = 0
	var e = 0
	if Input.is_action_pressed("dir"):
		d = 1
	if Input.is_action_pressed("esq"):
		e = -1
	if get_pos().x > (get_viewport_rect().end.x - 50):
		d = 0
	if get_pos().x < 50:
		e = 0
	set_pos(get_pos() + Vector2(vel,0) * delta * (d + e))
		
#atirar
	if Input.is_action_pressed("atirar"):
		arma.disparar()
		pass
	arma.atualizar(delta)
	
func set_arma(numArma):
	arma = armas[numArma]
		


#class TiroRapido:
#	extends TiroSimples
#		var intervalo = 1.4


func _on_Nave_area_enter( area ):
	if area.is_in_group(Game.GROUP_INIMIGOS):
		if area.has_method("destruir"):
			Game.setLifes()
			area.destruir()
			
		#print(Game.GROUP_INIMIGOS)

	
	pass # replace with function body
