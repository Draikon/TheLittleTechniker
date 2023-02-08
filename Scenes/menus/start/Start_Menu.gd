extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

signal game_start


# Called when the node enters the scene tree for the first time.
func _ready():
	$ButtonExit.connect("button_down", self, "exit_game")	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func exit_game():
	get_tree().quit()

func _on_Button_pressed():
	emit_signal("game_start")
	pass # Replace with function body.
