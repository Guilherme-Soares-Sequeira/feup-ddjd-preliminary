extends Area2D

func _on_body_entered(body):
	if (not body.has_method("handle_enter_water")):
		return
	
	body.handle_enter_water(self)
