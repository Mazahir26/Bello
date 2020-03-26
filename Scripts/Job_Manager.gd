extends VBoxContainer


func drop_data(_pos, data):
	if typeof(data) == TYPE_OBJECT :
		var node = data.duplicate()
		self.add_child(node)
		data.queue_free()
	pass


func can_drop_data(_pos, data):
	return data
	
func Save_Table (tem : Dictionary) :
	var data = get_parent().get_parent().Save_Table(tem)
	return data
	pass

export(PackedScene) var Job 
func Load_Table (data) :
	var node = Job.instance()
	self.add_child(node)
	var pos  = data.keys()
	var temp = {}
	temp = data.values()
	node.Load_job(temp[0])
	self.move_child(node,int(pos[0]))
	
	pass

func _ready() -> void:
	pass
