extends Node2D

var ChickenScene = preload("res://Scenes/chicken/Chicken.tscn")
var BarmerScene = preload("res://BarmerBoy.tscn")

var rng = RandomNumberGenerator.new()

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	rng.randomize()
	pass


func _on_Timer_timeout():
	var i = rng.randi_range(0, 2)
	
	
	if i == 0:
		var b = BarmerScene.instance();
		b.position = self.position
		self.get_parent().add_child(b);
	else:
		var chicken = ChickenScene.instance();
		chicken.position = self.position
		self.get_parent().add_child(chicken);
	
	pass # Replace with function body.
