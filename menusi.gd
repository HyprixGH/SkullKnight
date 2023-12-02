extends Sprite2D

var button: Button
var is_hovered: bool = false

func _ready():
	button = $sibutton  # Reference to the "Ball" button
	self.visible = false # Initially hide the Sprite


func _on_sibutton_mouse_entered():
	is_hovered = true
	self.visible = true
	







func _on_sibutton_mouse_exited():
	is_hovered = false
	self.visible = false
