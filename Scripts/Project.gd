extends Control

export(Array,Color) var Colors 
export(PackedScene) var Job 
var lolo = [Color.aqua,Color.coral,Color.cornflower,Color.cyan,Color.darksalmon,Color.wheat,Color.fuchsia,Color.lavender,Color.cadetblue,Color.lightslategray,Color.seashell]
func add_job() :
	var node = Job.instance()
	var nodes = get_tree().get_nodes_in_group("job_manager")
	if nodes.size() == 0 :
		return
	if nodes[0].Child_count() > 9 :
		$UI.Warning("Too Many Events in one Panel")
		yield(get_tree().create_timer(2),"timeout")
		$UI.info_display()
		return
	else :
		nodes[0].add_job(node)
	pass
 
func load_data () :
	if Manger.load_Data :
		Manger.Load_Data(self)
	pass
var rand = 0
var iny = -1
var pos = Vector2(62,102)

var j = 0
var classes = []
func Setup(data) :
	print(data)
	var nodes = get_tree().get_nodes_in_group("job_manager")
	
	if nodes.size() == 0 :
		new_plan_manger_cretor(data)
	else :
		for i in nodes :
			if data.has(i.call("Get_class")) :
				 i.setup(data)
			else : new_plan_manger_cretor(data)
	pass
	
	
func new_plan_manger_cretor(data : Dictionary) :
	var tep = data.keys()
	for i in range(0,classes.size()) :
		if tep[0] == classes[i] :
			return
	iny = iny + 1
	rand = randi()%lolo.size()
	var node = load("res://Scene/Job_manager.tscn")
	var tem = node.instance()
	tem.new_setup(tep[0],lolo[rand])
	tem.setup(data)
	self.add_child(tem)
	classes.insert(j,tep[0])
	j = j + 1

func _ready() -> void:
	load_data()
	pass
var no = 0
func Add_panal() :
	if get_child_count() > 25 :
		return
	var temmmp = "Default"
	var node = load("res://Scene/Job_manager.tscn").instance()
	if no != 0 :
		temmmp = "Default " + String(no)
	node.new_setup(temmmp,lolo[randi()%lolo.size()])
	node.rect_position = pos 
	self.add_child(node)
	no += 1
	


func Warning_Panel(node : Object) :
	$UI.Display_Warning("Do You Want to Delete this Panel?",node)
