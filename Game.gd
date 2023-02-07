extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$Player.connect("player_dies", self, "show_dead_anim")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	get_node("Camera2D").position.x = get_node("Player").position.x
	#if get_node("Player").

func show_dead_anim():
	$Lost.visible = true
