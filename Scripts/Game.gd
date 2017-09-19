extends Node

const GROUP_INIMIGOS = "inimigos"
const GROUP_NAVE	 = "naves"

var score = 0 setget getScore,setScore
var lifes = 3 setget getLifes,setLifes

signal score_change
signal life_change

func _ready():
	randomize()
	pass

func getCamera():
	return get_tree().get_root().get_node("Level1").get_node("Camera")
	
func getScore():
	return score
	
func setScore(valor):
	if(valor > 0):
		score += valor
		emit_signal("score_change")

func getLifes():
	return lifes
	
func setLifes():
	lifes -= 1
	emit_signal("life_change")
	




