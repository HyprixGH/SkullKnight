extends Control

var selectedc = 1
# Called when the node enters the scene tree for the first time.
var flash : AnimationPlayer


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
	
	flash = $flash

func _on_rdybutton_pressed():
	
	$ready.play("ready")
	
func _on_siback_pressed():
	get_tree().change_scene_to_file("res://SKmainmenu.tscn")


func _on_csup_pressed():
	selectedc += 1
	
	if flash.is_playing():
		flash.stop()
	flash.play("flash")


func _on_csdown_pressed():
	selectedc -= 1
	
	
	if flash.is_playing():
		flash.stop()
	flash.play("flash")


