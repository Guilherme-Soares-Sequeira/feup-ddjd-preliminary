class_name Exit extends Area2D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func activate():
	self.set_collision_mask_value(1, true)
	# other stuff

func _on_body_entered(_body):
	print("Exit noticed a body entered!")
	pass
