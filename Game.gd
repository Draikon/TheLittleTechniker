extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func start_game():
	self.show()
	$Camera2D.make_current()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$Camera2D.position.x = $Player.position.x
	$Background.position.x = $Player.position.x
	#if get_node("Player").

func _on_Player_player_dies():
	$Lost.show()
	$Lost/AudioStreamPlayer.playing = true
