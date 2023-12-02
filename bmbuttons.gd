extends Panel


# Called when the node enters the scene tree for the first time.
var last_played_audio : AudioStreamPlayer

var buttonhl : AudioStreamPlayer

var buttonpress : AudioStreamPlayer

func _ready():
	buttonhl = $buttonhl
	
	buttonpress = $buttonpress




	
	

func _on_sibutton_mouse_entered():
	buttonhl.play()

func _on_mubutton_mouse_entered():
	buttonhl.play()

func _on_sebutton_mouse_entered():
	buttonhl.play()
	
func _on_shbutton_mouse_entered():
	buttonhl.play()
	
	
func _on_sigm_1_button_mouse_entered():
	buttonhl.play()
	
func _on_sigm_2_button_mouse_entered():
	buttonhl.play()


func play_audio():
	if not buttonhl.playing:
		var new_audio_player = buttonhl.duplicate()
		add_child(new_audio_player)
		new_audio_player.play()
		last_played_audio = new_audio_player

func _process(delta):
	# Check if the last played audio is finished and queue_free if needed
	if last_played_audio and not last_played_audio.playing:
		last_played_audio.queue_free()
		last_played_audio = null


func _on_sibutton_pressed():
	buttonpress.play()


func _on_mubutton_pressed():
	buttonpress.play()


func _on_sebutton_pressed():
	buttonpress.play()


func _on_shbutton_pressed():
	buttonpress.play()


func _on_sigm_1_button_pressed():
	buttonpress.play()


func _on_sigm_2_button_pressed():
	buttonpress.play()


func _on_siback_pressed():
	buttonhl.play()
