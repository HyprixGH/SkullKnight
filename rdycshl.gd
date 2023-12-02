extends Sprite2D


# Called when the node enters the scene tree for the first time.
var button: Button
var is_hovered: bool = false

func _ready():
	button = $rdybutton  # Reference to the "Ball" button
	self.visible = false # Initially hide the Sprite


func _on_rdybutton_mouse_entered():
	is_hovered = true
	self.visible = true
	$"../rdycs".visible = false
	








func _on_rdybutton_mouse_exited():
	is_hovered = false
	self.visible = false
	$"../rdycs".visible = true
	


