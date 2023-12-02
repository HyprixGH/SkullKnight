extends Sprite2D


# Called when the node enters the scene tree for the first time.
var button: Button
var is_hovered: bool = false


func _ready():
	button = $sigm1button  # Reference to the "Ball" button
	self.visible = false
	


func _on_sigm_1_button_mouse_entered():
	is_hovered = true
	self.visible = true


func _on_sigm_1_button_mouse_exited():
	is_hovered = false
	self.visible = false
