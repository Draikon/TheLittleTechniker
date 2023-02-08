extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func start_game():
	self.visible = true
	$Camera2D.make_current()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$Camera2D.position.x = $Player.position.x
	$Background.position.x = $Player.position.x
	#if get_node("Player").

func _on_Player_player_dies():

	# todo: reset viewport
	$WinLoose/YoureDead.visible =true
	$WinLoose.visible = true
	$WinLoose/AudioStreamPlayer.playing = true
	$Player.run_speed = 0
	$WinLoose.position.x = $Player.position.x / 2

func _on_Player_player_wins():
	$WinLoose/YouWon.visible = true
	$WinLoose.visible = true
	$WinLoose/AudioStreamPlayer.playing = true
	$Player.run_speed = 0
	$WinLoose.position.x = $Player.position.x / 2
