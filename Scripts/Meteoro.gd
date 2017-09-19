extends Area2D

var vida = 3
var vel = 175
var rot


func _ready():
	add_to_group(Game.GROUP_INIMIGOS)
	randomize()
	rot = rand_range(-2,2)
	set_process(true)

func _process(delta):
	
	rotate(rot *delta)
	set_pos(get_pos()+Vector2(0,1)*vel*delta)
	
func sofrer_dano(dano):
	get_node("Anim").play("Hit")
	if 0 == rand_range(0,1):
		get_node("Sample").play("hit")
	else:
		get_node("Sample").play("hit2")
	vida -= dano
	if vida <=0 :
		destruir()
		 
func destruir():
	Game.setScore(10)
	get_node("Sample").play("explosao")
	set_z(10)
	set_process(false)
	get_node("Anim").play("destroy")
	Game.getCamera().shake()
	remove_from_group(Game.GROUP_INIMIGOS)
	
	