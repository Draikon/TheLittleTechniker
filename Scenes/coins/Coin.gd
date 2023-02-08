extends Area2D

signal coin_collected

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
	


func _on_Coin_body_entered(body):
	emit_signal("coin_collected")
	queue_free()
