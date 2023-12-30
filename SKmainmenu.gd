extends Control




  # Assuming you have a node named "bob" in your scene


func _ready():
	$sigm.visible = false
	$sigm1.visible = false
	$sigm2.visible = false
	
	
	mmbutton = $mmbutton
	sigmbutton = $sigmbutton

	
	
	
	bmbuttons = $bmbuttons
	sigmbuttons = $sigmbuttons
	
	

	

	sigmbuttons.position.y -= 2000





func _on_sibutton_pressed():
	
	if mmbutton.is_playing():
		mmbutton.stop()
	
	mmbutton.play("mmbutton1")
	
	await get_tree().create_timer(0.12).timeout
	
	
	
	$sigm.visible = true


	bmbuttons.position.y += 2000
	
	sigmbuttons.position.y += 2000  
	

func _on_mubutton_pressed():
	
	if mmbutton.is_playing():
		mmbutton.stop()
	
	mmbutton.play("mmbutton2")
	

	







var mmbutton : AnimationPlayer
var sigmbutton : AnimationPlayer

var bmbuttons : Panel
var sigmbuttons : Panel





func _on_siback_pressed():
	$sigm.visible = false
	$sigm1.visible = false
	$sigm2.visible = false
	
	bmbuttons.position.y -= 2000
	
	sigmbuttons.position.y -= 2000  


func _on_sigm_1_button_pressed():
	sigmbutton.play("sigmbutton1")
	
	await get_tree().create_timer(0.12).timeout
		
	get_tree().change_scene_to_file("res://orange_skully.tscn")






func _on_sigm_2_button_pressed():
	sigmbutton.play("sigmbutton2")
