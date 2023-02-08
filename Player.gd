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
		facing = "right"
	if left:
		velocity.x -= run_speed
		$AnimatedSprite.flip_h = false
		facing = "left"
	if shoot:
		shoot()

func _physics_process(delta):
	velocity.y += gravity * delta
	get_input()
	velocity = move_and_slide(velocity, Vector2(0, -1))

func shoot():
	var f = flower.instance();
	var direction = 0
	if facing == "left":
		direction = -1
	
	if facing == "right":
		direction = 1
	
	f.position.x = self.position.x
	f.position.y = self.position.y
	
	var v = Vector2(0, -600);
	v = v.rotated(deg2rad(45 * direction));
	f.linear_velocity = v;
	
	self.get_parent().add_child(f);
	
func _on_DeadZone_body_entered(body):
	if self == body:
		playerDies()
	pass # Replace with function body.
	
func _on_WinZone_body_entered(body):
	if self == body:
		emit_signal("player_wins")
	pass # Replace with function body.
	
func playerDies():
	emit_signal("player_dies")	

func coin_collected():
	$CoinSound.play()
	coins += 1
