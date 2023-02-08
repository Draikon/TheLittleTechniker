extends RigidBody2D

var ttl = 2;

func _process(delta):
	ttl -= delta
	
	if ttl < 0:
		self.get_parent().remove_child(self)
	
