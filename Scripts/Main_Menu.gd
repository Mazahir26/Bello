extends Control

onready var anim = $Tween
onready var project = preload("res://Scene/Project.tscn")

func _ready() -> void:
	pass


func _on_Options_button_down() -> void:
	$Main_Menu/Options.show()
	$Main_Menu/Label.text = "Options"
	
	anim.interpolate_property($Main_Menu/start/Continue,"rect_position:x",$Main_Menu/start/Continue.rect_position.x,$Main_Menu/start/Continue.rect_position.x-900,0.2,Tween.TRANS_LINEAR,Tween.EASE_OUT)
	anim.interpolate_property($Main_Menu/start/Newproject,"rect_position:x",$Main_Menu/start/Newproject.rect_position.x,$Main_Menu/start/Newproject.rect_position.x-900,0.2,Tween.TRANS_LINEAR,Tween.EASE_OUT,0.1)
	anim.interpolate_property($Main_Menu/start/Options,"rect_position:x",$Main_Menu/start/Options.rect_position.x,$Main_Menu/start/Options.rect_position.x-900,0.2,Tween.TRANS_LINEAR,Tween.EASE_OUT,0.2)
	anim.interpolate_property($Main_Menu/start/Exit,"rect_position:x",$Main_Menu/start/Exit.rect_position.x,$Main_Menu/start/Exit.rect_position.x-900,0.2,Tween.TRANS_LINEAR,Tween.EASE_OUT,0.3)
	
	
	anim.interpolate_property($Main_Menu/Options/Theme,"rect_position:x",900,7,0.2,Tween.TRANS_LINEAR,Tween.EASE_OUT,0.1)
	anim.interpolate_property($Main_Menu/Options/Credits,"rect_position:x",900,7,0.2,Tween.TRANS_LINEAR,Tween.EASE_OUT,0.2)
	anim.interpolate_property($Main_Menu/Options/Back,"rect_position:x",900,7,0.2,Tween.TRANS_LINEAR,Tween.EASE_OUT,0.3)
	


	anim.start()
	pass


func _on_Back_button_down() -> void:
	
	$Main_Menu/Label.text = "Main Menu"
	anim.interpolate_property($Main_Menu/Options/Theme,"rect_position:x",7,900,0.2,Tween.TRANS_LINEAR,Tween.EASE_OUT,0.1)
	anim.interpolate_property($Main_Menu/Options/Credits,"rect_position:x",7,900,0.2,Tween.TRANS_LINEAR,Tween.EASE_OUT,0.2)
	anim.interpolate_property($Main_Menu/Options/Back,"rect_position:x",7,900,0.2,Tween.TRANS_LINEAR,Tween.EASE_OUT,0.3)
	
	
	anim.interpolate_property($Main_Menu/start/Continue,"rect_position:x",$Main_Menu/start/Continue.rect_position.x,$Main_Menu/start/Continue.rect_position.x+900,0.2,Tween.TRANS_LINEAR,Tween.EASE_OUT)
	anim.interpolate_property($Main_Menu/start/Newproject,"rect_position:x",$Main_Menu/start/Newproject.rect_position.x,$Main_Menu/start/Newproject.rect_position.x+900,0.2,Tween.TRANS_LINEAR,Tween.EASE_OUT,0.1)
	anim.interpolate_property($Main_Menu/start/Options,"rect_position:x",$Main_Menu/start/Options.rect_position.x,$Main_Menu/start/Options.rect_position.x+900,0.2,Tween.TRANS_LINEAR,Tween.EASE_OUT,0.2)
	anim.interpolate_property($Main_Menu/start/Exit,"rect_position:x",$Main_Menu/start/Exit.rect_position.x,$Main_Menu/start/Exit.rect_position.x+900,0.2,Tween.TRANS_LINEAR,Tween.EASE_OUT,0.3)
	
	anim.start()
	pass # Replace with function body.



func _on_Credits_button_down() -> void:
	
	$Main_Menu/Label.text = "Credits"
	anim.interpolate_property($Main_Menu/Options/Theme,"rect_position:x",7,-900,0.2,Tween.TRANS_LINEAR,Tween.EASE_OUT)
	anim.interpolate_property($Main_Menu/Options/Credits,"rect_position:x",7,-900,0.2,Tween.TRANS_LINEAR,Tween.EASE_OUT,0.1)
	anim.interpolate_property($Main_Menu/Options/Back,"rect_position:x",7,-900,0.2,Tween.TRANS_LINEAR,Tween.EASE_OUT,0.2)
	
	anim.interpolate_property($Main_Menu/Credits/Crdits,"rect_position:x",900,7,0.2,Tween.TRANS_LINEAR,Tween.EASE_OUT,0.2)
	anim.interpolate_property($Main_Menu/Credits/Back,"rect_position:x",900,7,0.2,Tween.TRANS_LINEAR,Tween.EASE_OUT,0.2)
	anim.start()
	pass # Replace with function body.


func _on_BackCredits_button_down() -> void:
	$Main_Menu/Label.text = "Options"
	anim.interpolate_property($Main_Menu/Options/Theme,"rect_position:x",-900,7,0.2,Tween.TRANS_LINEAR,Tween.EASE_OUT)
	anim.interpolate_property($Main_Menu/Options/Credits,"rect_position:x",-900,7,0.2,Tween.TRANS_LINEAR,Tween.EASE_OUT,0.1)
	anim.interpolate_property($Main_Menu/Options/Back,"rect_position:x",-900,7,0.2,Tween.TRANS_LINEAR,Tween.EASE_OUT,0.2)
	
	anim.interpolate_property($Main_Menu/Credits/Crdits,"rect_position:x",7,900,0.2,Tween.TRANS_LINEAR,Tween.EASE_OUT,0.2)
	anim.interpolate_property($Main_Menu/Credits/Back,"rect_position:x",7,900,0.2,Tween.TRANS_LINEAR,Tween.EASE_OUT,0.2)
	anim.start()
	pass # Replace with function body.


func _on_Exit_button_down() -> void:
	get_tree().quit()
	pass # Replace with function body.


func _on_Continue_button_down() -> void:
	var Save_Game = File.new()
	if not Save_Game.file_exists(Manger.get_Path()):
		print("Not_Saved")
		$Main_Menu/start/Continue.text = "Not Saved!"
		yield(get_tree().create_timer(2),"timeout")
		$Main_Menu/start/Continue.text = "Continue"
	else :
# warning-ignore:return_value_discarded
		Manger.load_Data = true
		get_tree().change_scene("res://Scene/continue_Project.tscn")
		
	
	pass # Replace with function body.


func _on_Newproject_button_down() -> void:
	Manger.load_Data = false
# warning-ignore:return_value_discarded
	get_tree().change_scene("res://Scene/Project.tscn")
	pass # Replace with function body.


func _on_Crdits_meta_clicked(meta) -> void:
	var err = OS.shell_open(meta)
	if (err == OK):
		print("Opened link '%s' successfully!" % meta)
	else:
		print("Failed opening the link '%s'!" % meta)
	pass # Replace with function body.
