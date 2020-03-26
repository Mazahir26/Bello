extends Control

func get_drag_data(_position: Vector2):
	$PanelContainer/VBoxContainer/Heading.caret_position = -3
	$PanelContainer/VBoxContainer/Discreption.caret_position = -3
	var job = self.duplicate()
	set_drag_preview(job)
	return self
	

func Load_Job (heading:String,content:String) :
	$PanelContainer/VBoxContainer/Heading.text = heading
	$PanelContainer/VBoxContainer/Discreption.text = content
	pass

func Save_job () :
	var temp = {
		"Heading" : $PanelContainer/VBoxContainer/Heading.text,
		"Content" : $PanelContainer/VBoxContainer/Discreption.text}
	var dic = {self.get_index() : temp}
	var data = get_parent().Save_Table(dic)
	return data
	


#
#func _input(event: InputEvent) -> void:
#	if event.is_action_pressed("temp"):
#		Save_job()

func Load_job(data : Dictionary) :
	$PanelContainer/VBoxContainer/Heading.text = data["Heading"]
	$PanelContainer/VBoxContainer/Discreption.text = data["Content"]
	pass


func _on_VBoxContainer_gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton :
		if event.doubleclick :
			$PanelContainer/VBoxContainer/Discreption.mouse_filter = Control.MOUSE_FILTER_STOP
			$PanelContainer/VBoxContainer/Heading.editable = true
			$PanelContainer/VBoxContainer/Heading.editabe = true
			$PanelContainer/VBoxContainer/Discreption.editabe = true
#			$PanelContainer/VBoxContainer.mouse_filter = MOUSE_FILTER_IGNORE
			$PanelContainer/VBoxContainer/Heading.mouse_filter = Control.MOUSE_FILTER_STOP
	pass # Replace with function body.
