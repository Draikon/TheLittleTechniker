extends RigidBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if $AnimatedSprite.animation == 'move':
		position.x = position.x -35 * delta
#	pass


func _on_BehaviorTimer_timeout():
	if $AnimatedSprite.animation == 'idle':
		 $AnimatedSprite.animation = 'move'
	elif $AnimatedSprite.animation == 'move':
		$AnimatedSprite.animation = 'idle'
