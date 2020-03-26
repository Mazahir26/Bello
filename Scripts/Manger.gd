extends Node

var path = "res://save.json"
var load_Data : bool = true
func Load_Data (var project : Node) :
	var Save_Game = File.new()
	var current_line 
	var last_line
	var tep
	if not Save_Game.file_exists(path):
		print("Not_Saved")
		return 
	Save_Game.open(path,File.READ)
	while not Save_Game.eof_reached() :
		tep = Save_Game.get_line()
		if tep != "" :
			current_line = parse_json(tep)
		if current_line == last_line :
			return
		if current_line != null :
			project.Setup(current_line)
			last_line = current_line
	Save_Game.close()
	
	pass
	



func Save_Data() :
	var save_game = File.new()
	save_game.open(path, File.WRITE)
	var Nodes = get_tree().get_nodes_in_group("Job")
	for i in Nodes :
		var node_data = i.call("Save_job")
		save_game.store_line(to_json(node_data))
	save_game.close()
	pass
	
func  _ready() -> void:
	pass
	

func get_Path():
	return path
