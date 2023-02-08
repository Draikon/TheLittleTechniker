extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$Camera2D.position.x = $Player.position.x
	#if get_node("Player").

func _on_Player_player_dies():
	# todo: reset viewport
	$Lost.visible = true
	$Lost/AudioStreamPlayer.playing = true
