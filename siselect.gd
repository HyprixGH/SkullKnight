extends Control

var selectedc = Global.selectedc
# Called when the node enters the scene tree for the first time.




func _process(delta):
	
	if selectedc > 4:
		selectedc -= 4

	if selectedc < 1:
		selectedc = 4
	
	
	
	if selectedc == 1:
		get_node("characterp").play("orangeskullyp")
	if selectedc == 2:
		get_node("characterp").play("greenskullyp")
	if selectedc == 3:
		get_node("characterp").play("redskullyp")
	if selectedc == 4:
		get_node("characterp").play("blueskullyp")

func _ready():
	$rdycshl.visible = false
	
	
func _on_rdybutton_pressed():
	
	$ready.play("ready")
	
	get_tree().change_scene_to_file("res://.tscn")
	
func _on_siback_pressed():
	await get_tree().create_timer(0.01).timeout
	get_tree().change_scene_to_file("res://SKmainmenu.tscn")


func _on_csup_pressed():
	selectedc += 1
	update_selected_character()


func _on_csdown_pressed():
	selectedc -= 1
	update_selected_character()
	

func update_selected_character():
	if selectedc > 4:
		selectedc -= 4
	if selectedc < 1:
		selectedc = 4
