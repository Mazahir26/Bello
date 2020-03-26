extends LineEdit



func _ready() -> void:
	self.mouse_filter = Control.MOUSE_FILTER_IGNORE


func _on_LineEdit_gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton :
		if !self.editable:
#			mouse_filter = Control.MOUSE_FILTER_STOP
			self.editable = true
	elif Input.is_action_just_released("UI_OK") and self.editable :
			self.editable = false
			mouse_filter = Control.MOUSE_FILTER_IGNORE
	pass # Replace with function body.

var editabe = true
func _on_LineEdit_mouse_exited() -> void:
	editabe = false
func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton and editabe == false:
		self.editable = false
		mouse_filter = Control.MOUSE_FILTER_IGNORE
#
func _on_LineEdit_mouse_entered() -> void:
	editabe = true
	pass # Replace with function body.
