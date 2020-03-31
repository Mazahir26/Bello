extends PanelContainer

export(Color) var color
export(String) var Class

var dicton = []
func _ready() -> void:
	$VBoxContainer/HBoxContainer/Label.text = Class
	self.self_modulate = color

	

func _process(_delta: float) -> void:
	
	if move :
		$VBoxContainer/Planed_Manager.margin_bottom = self.margin_bottom
		self.rect_global_position = Vector2(get_global_mouse_position().x-(self.rect_size.x/2),get_global_mouse_position().y)
	else :
		self.margin_bottom = -50
		$VBoxContainer/Planed_Manager.margin_bottom = 100
#		self.margin_bottom = $VBoxContainer/Planed_Manager.margin_bottom

var move = false
func _on_Label_gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton :
		if event.is_action_pressed("ui_accept") :
			if  $VBoxContainer/HBoxContainer/Label.is_class("LineEdit") :
				if $VBoxContainer/HBoxContainer/Label.editable != true :
					move = true
			if $VBoxContainer/HBoxContainer/Label.is_class("Label") :
				move = true
		if event.doubleclick  :
			if $VBoxContainer/HBoxContainer/Label.is_class("LineEdit") :
				$VBoxContainer/HBoxContainer/Label.editable = true
				move = false




func _input(event: InputEvent) -> void:

	if event.is_action_pressed("temp") and $VBoxContainer/HBoxContainer/Label.is_class("LineEdit") :
		if $VBoxContainer/HBoxContainer/Label.editable == true :
			$VBoxContainer/HBoxContainer/Label.editable = false
		
	if event.is_action_released("ui_accept") and move == true :
			move = false
	

func Save_Table (tem : Dictionary) :
	var tet = {Class : tem,
			   "pos" : self.rect_global_position}
	return tet
	
	
func add_job(node : Object) :
	$VBoxContainer/Planed_Manager.add_child(node)

func new_setup(cla : String,clor : Color) :
	$VBoxContainer/HBoxContainer/Label.text = cla
	Class = cla
	self.self_modulate = clor
	color = clor

func Get_class() :
	return Class

export(PackedScene) var Job 

func setup(data : Dictionary) :
	var temp  = {}
	temp = data[Class]
	self.rect_global_position = conveter(data["pos"])
	$VBoxContainer/Planed_Manager.Load_Table(temp)
	pass

func conveter(stri : String) :
	var cords = stri
	cords.erase(cords.find("("),1)
	cords.erase(cords.find(")"),1)
	cords.erase(cords.find(","),1)
	var x = cords.left(cords.find(" "))
	var y = cords.right(cords.find(" "))
	cords = Vector2(x,y)
	return cords


func _on_Label_text_changed(new_text: String) -> void:
	Class = new_text
	pass # Replace with function body.


func _on_Button_button_down() -> void:
	if $VBoxContainer/Planed_Manager.get_child_count() == 0 :
		self.queue_free()
	else :
		get_parent().Warning_Panel(self)

	pass # Replace with function body.


func Child_count() :
	return $VBoxContainer/Planed_Manager.get_child_count()
	pass
