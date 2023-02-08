extends Button


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func exit_game():
	print("down")
	get_tree().quit()


func _on_Button_visibility_changed():
	print("vis")
	self.connect("button_down", self, "exit_game")


func _on_Button_button_down():
	print("d2")
	pass # Replace with function body.
