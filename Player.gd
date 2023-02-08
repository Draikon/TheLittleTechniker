extends KinematicBody2D

var facing = "idle" # or left or right

var flower = preload("res://Flower.tscn");
signal player_dies
signal player_wins

var run_speed = 350
var jump_speed = -1000
var gravity = 2500

var velocity = Vector2()

var coins = 0

func _ready():
	$AnimatedSprite.animation = "default"

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
		$AnimatedSprite.flip_h = true
	if left:
		velocity.x -= run_speed
		$AnimatedSprite.flip_h = false
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
	
func _on_DeadZone_body_entered(body):
	if self == body:
		emit_signal("player_dies")
	pass # Replace with function body.
	
func _on_WinZone_body_entered(body):
	if self == body:
		emit_signal("player_wins")
	pass # Replace with function body.

func coin_collected():
	coins += 1
