extends Node

var paths = []
const PATH_DIR = "res://paths/"

func _ready():
	carregaPath()
	pass
func random_path():
	return paths[rand_range(0,paths.size())]

func carregaPath():
	var dir = Directory.new()
	dir.change_dir(PATH_DIR)
	dir.list_dir_begin()
	
	var file = dir.get_next()
	while file != "":
		
		var path = load(PATH_DIR + file)
		if path && path extends Curve2D:
			paths.append(path)
		file = dir.get_next()
	print(paths.size())