extends Camera2D

var Zoom_step = 1.1
var min_zoom = 1
var max_zoom = 2


var pan_speed = 800
var limit_rect = null setget set_limit_rect

var mouse_captured = false

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("Zoom_in"):
		zoom/=Zoom_step
		_snap_zoom_limits()
	if event.is_action_pressed("Zoom_out"):
		zoom*= Zoom_step
		_snap_zoom_limits()
		
	if event.is_action_pressed("dranging") :
		mouse_captured = true
	if event.is_action_released("dranging") :
		mouse_captured = false
		
	if mouse_captured && event is InputEventMouseMotion :
		position -= event.relative * zoom
		
		
func _Snap_to_limits():
	position.x = clamp(position.x,limit_rect.position.x,limit_rect.end.x)
	position.y = clamp(position.y,limit_rect.position.y,limit_rect.end.y)
	
	
func _snap_zoom_limits():
	zoom.x = clamp(zoom.x,min_zoom,max_zoom)
	zoom.y = clamp(zoom.y,min_zoom,max_zoom)
	
func set_limit_rect(rect):
	limit_rect = rect
	_Snap_to_limits()
