class_name Exit extends Area2D

signal lemming_exited()

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func activate():
	print("exit activated")
	self.set_collision_mask_value(1, true)
	%MeshInstance2D.set_modulate(Color(66, 176, 245))
	# other stuff

func _on_body_entered(body):
	if not (is_instance_of(body, Lemming)):
		return
	self.lemming_exited.emit()
	print("lemming exited")	
	body.handle_exit()
