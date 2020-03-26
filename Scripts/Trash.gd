extends Button

var drop = false

func can_drop_data(_pos, data):
	drop = true
	return data

func drop_data(_pos, data):
	if typeof(data) == TYPE_OBJECT :
		data.queue_free()
		drop = false



func _process(_delta: float) -> void:
	if drop :
		self.icon = load("res://Assets/trashcanOpen.png")
		get_parent().Warning("Do you want to Delete this Event?")
		get_parent().waring = true
	else : 
		self.icon = load("res://Assets/trashcan.png")
		



func _on_Trash_mouse_exited() -> void:
	drop = false
	get_parent().waring = false
	get_parent().info_display()
	
	pass # Replace with function body.
