class_name MechanicBachelor extends Area2D

func _on_body_entered(body):
	print("mechanic body entered")
	if not body.has_method("handle_mechanic"):
		return
	body.handle_mechanic()
