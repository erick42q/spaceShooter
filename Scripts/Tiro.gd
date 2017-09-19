extends Area2D
var dano = 1
var vel = 1000

func _ready():
	set_process(true)	
	get_node("Sample").play("tiro2low")
	pass
	
func _process(delta):
	set_pos(get_pos()+Vector2(0,-1) * vel * delta)#faz se mover
	#deleta depois que sair da tela
	if get_pos().y < -40 :
		
		queue_free()

func _on_Tiro_area_enter( area ):
	#print(area.get_groups())
	if area.is_in_group(Game.GROUP_INIMIGOS):
		if area.has_method("sofrer_dano"):
			area.sofrer_dano(dano)
			queue_free()
				
		print(Game.GROUP_INIMIGOS)

	pass # replace with function body





