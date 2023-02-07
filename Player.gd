extends KinematicBody2D

var flower = preload("res://Flower.tscn");

var run_speed = 350
var jump_speed = -1000
var gravity = 2500

var velocity = Vector2()

func get_input():
	velocity.x = 0
	var right = Input.is_action_pressed('ui_right')
	var left = Input.is_action_pressed('ui_left')
	var jump = Input.is_action_just_pressed('ui_select')
	var shoot = Input.is_action_just_pressed("ui_down")

	if is_on_floor() and jump:
		velocity.y = jump_speed
	if right:
		velocity.x += run_speed
	if left:
		velocity.x -= run_speed
	if shoot:
		shoot()

func _physics_process(delta):
	velocity.y += gravity * delta
	get_input()
	velocity = move_and_slide(velocity, Vector2(0, -1))

func shoot():
	var f = flower.instance();
	f.position.x = self.position.x + 50
	f.position.y = self.position.y - 50
	f.linear_velocity =  Vector2(300, -300)
	f.gravity_scale = 10
	
	self.get_parent().add_child(f);
	
	pass
