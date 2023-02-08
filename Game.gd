extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	var coins = get_tree().get_nodes_in_group("coins")
	for coin in coins:  
		coin.connect("coin_collected", $Player, "coin_collected")
	pass # Replace with function body.

func start_game():
	$AudioBackground.playing = true
	self.show()
	$Camera2D.make_current()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$Camera2D.position.x = $Player.position.x
	$CoinLabel.rect_position.x = $Player.position.x -480
	#if get_node("Player").

func _on_Player_player_dies():
	# todo: reset viewport
	$AudioBackground.playing = false
	$WinLoose/YoureDead.show()
	$WinLoose.show()
	$WinLoose/AudioLoose.playing = true
	$Player.run_speed = 0
	$Player.jump_speed = 0
	$WinLoose.position.x = $Player.position.x / 2 - 500

func _on_Player_player_wins():
	$AudioBackground.playing = false
	$WinLoose/YouWon.show()
	$WinLoose.show()
	$WinLoose/AudioWin.playing = true
	$Player.run_speed = 0
	$Player.jump_speed = 0
	$WinLoose.position.x = $Player.position.x / 2 + 250


func _on_Game_visibility_changed():
	start_game()
	pass # Replace with function body.


func _on_Player_coins_increased(coins):
	$CoinLabel.text = str(coins)
