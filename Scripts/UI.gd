extends CanvasLayer

var saved : bool = false

func _on_Job_button_down() -> void:
	get_parent().add_job()
	pass # Replace with function body.


func _on_zoomin_button_down() -> void:
	if $Camera2D.zoom > Vector2(1,1) :
		$Camera2D.zoom -= Vector2(0.2,0.2)
	pass # Replace with function body.


func _on_zoomout_button_down() -> void:
	if $Camera2D.zoom < Vector2(2,2) :
		$Camera2D.zoom += Vector2(0.2,0.2)
	pass # Replace with function body.


func _process(_delta: float) -> void:
	pass


func _on_Save_button_down() -> void:
	Manger.Save_Data()
	saved = true
	pass # Replace with function body.


func _on_Panalmanger_button_down() -> void:
	get_parent().Add_panal()
	pass # Replace with function body.


func _on_Home_button_down() -> void:
# warning-ignore:return_value_discarded
	if saved == true :
		get_tree().change_scene("res://Scene/Main_Menu.tscn")
	else :
		Waring_not_saved()
	pass # Replace with function body.

func Waring_not_saved():
	$Warning.show()
	$Warning/warning_panel/Text.text = "Project is Not Saved, Do you want to return Home?"
	



# about information and warning
var info = ["You can Delete an event by dragging it to the Trashcan",
			"This Project is Inspired by Terlo",
			"This Software is made from Godot",
			"This Project is Open Source",
			"You can Delete a Panel by clicking on the 'X' Button on the Panel",
			"You can Only Save one project at a time"]
var waring = false
func _ready() -> void:
	$Warning.hide()
	info_display()
	pass
	
func Warning(string  : String) :
	$information/icon.texture = load("res://Assets/exclamation.png")
	$information/Info.text = string
	$information.modulate =Color(1,0.10,0.12,0.54)
	pass
func info_display() :
	if waring  == false:
		$information.modulate =Color(0.26,0.25,0.25,0.54)
		$information/icon.texture = load("res://Assets/information.png")
		var tem = info[randi()%info.size()]
		$information/Info.text = tem
		yield(get_tree().create_timer(10),"timeout")
		info_display()
	pass


var delete_panal : Object = null
var war = false
func Display_Warning(warning : String, node : Object) :
	war = true
	$Warning/warning_panel/Text.text = warning
	delete_panal = node
	$Warning.show()
	pass
	
	
	


func _on_OK_button_down() -> void:
	if war :
		delete_panal.queue_free()
		$Warning.hide()
	if saved == false :
# warning-ignore:return_value_discarded
		get_tree().change_scene("res://Scene/Main_Menu.tscn")
	pass # Replace with function body.


func _on_Cancel_button_down() -> void:
	if war :
		$Warning.hide()
	if saved == false :
		$Warning.hide()
	pass # Replace with function body.
