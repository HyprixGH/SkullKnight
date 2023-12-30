extends Sprite2D

var button: Button
var is_hovered: bool = false

#var highlight_texture: Texture

func _ready():
	button = $sibutton  # Reference to the "Ball" button
	self.visible = false # Initially hide the Sprite
	
	#highlight_texture = preload("res://main menu compressed/sib select.png")

func _on_sibutton_mouse_entered():
	is_hovered = true
	self.visible = true
	







func _on_sibutton_mouse_exited():
	is_hovered = false
	self.visible = false
