extends RigidBody2D

var ttl = 2;

func _process(delta):
	ttl -= delta
	
	if ttl < 0:
		self.destroy()
	
	var bodies = self.get_colliding_bodies()
	
	if bodies.size() > 0:
		print_debug(bodies[0].get_class())
		if bodies[0].has_method("hit"):
			bodies[0].hit()
		
		destroy()


func destroy(): 
	self.get_parent().remove_child(self)
