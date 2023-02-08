extends KinematicBody2D

var gravity = 0

var velocity = Vector2()
var direction = 1

func _physics_process(delta):
	if self.position.x >= 900 or self.position.x <= 100:
		direction = direction * -1
	
	velocity.y += gravity
	velocity.x = direction * 200
	
		
	velocity = move_and_slide(velocity, Vector2(0, -1))
