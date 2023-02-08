extends KinematicBody2D

var gravity = 500

var velocity = Vector2()
var direction = -1


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _physics_process(delta):
	velocity.y += gravity * delta
	velocity.x = 0
	
	if is_on_wall():
		direction = direction * -1
		$AnimatedSprite.flip_h = not $AnimatedSprite.flip_h
		
	if $AnimatedSprite.animation == 'move' and is_on_floor():
		velocity.x += direction * 2000 * delta
	
	velocity = move_and_slide(velocity, Vector2(0, -1))

func _on_top_checker_body_entered(body):
	$AnimatedSprite.animation = 'platt'

func _on_BehaviorTimer_timeout():
	if $AnimatedSprite.animation == 'idle':
		$AnimatedSprite.animation = 'move'
	elif $AnimatedSprite.animation == 'move':
		$AnimatedSprite.animation = 'idle'

func _on_AnimatedSprite_animation_finished():
	if ($AnimatedSprite.animation == 'platt'):
		$AnimatedSprite.stop()
		hide()
		queue_free()

