extends Panel


# Called when the node enters the scene tree for the first time.

	
var last_played_audio : AudioStreamPlayer

var buttonhl : AudioStreamPlayer

var buttonpress : AudioStreamPlayer

func _ready():
	buttonhl = $buttonhl
	
	buttonpress = $buttonpress


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if last_played_audio and not last_played_audio.playing:
		last_played_audio.queue_free()
		last_played_audio = null
		

func _on_csup_pressed():
	buttonhl.play()


func _on_csdown_pressed():
	buttonhl.play()


func _on_siback_pressed():
	buttonhl.play()


func _on_rdybutton_mouse_entered():
	buttonhl.play()

func _on_rdybutton_pressed():
	buttonpress.play()
