var intervalo = 0.3
var timerTiro = 0
const preTiro = preload("res://Objetos/TiroVerde.tscn")
var nave

func _init(nave):
	self.nave = nave

func disparar():
	if(timerTiro <= 0):
		atirar(nave.get_node("PositionE"))
		#atirar(nave.get_node("PositionC"))
		atirar(nave.get_node("PositionD"))
		timerTiro = intervalo
func atirar(node):
	var tiro = preTiro.instance()
	tiro.set_global_pos(node.get_global_pos())
	nave.get_node("../").add_child(tiro)
	
func atualizar(delta):
	if timerTiro > 0:
		timerTiro -=delta
		