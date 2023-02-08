extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	var coins = get_tree().get_nodes_in_group("coins")
	for coin in coins:  
		coin.connect("coin_collected", $Player, "coin_collected")
	pass # Replace with function body.

func start_game():
	self.show()
	$Camera2D.make_current()
	Input.is_action_just_pressed('ui_select')

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$Camera2D.position.x = $Player.position.x
	#if get_node("Player").

func _on_Player_player_dies():
	# todo: reset viewport
	$WinLoose/YoureDead.show()
	$WinLoose.show()
	$WinLoose/AudioStreamPlayer.playing = true
	$Player.run_speed = 0
	$WinLoose.position.x = $Player.position.x / 2

func _on_Player_player_wins():
	$WinLoose/YouWon.show()
	$WinLoose.show()
	$WinLoose/AudioStreamPlayer.playing = true
	$Player.run_speed = 0
	$WinLoose.position.x = $Player.position.x / 2
