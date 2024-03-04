extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_body_entered(body):
	print("IN")
	print(body.speed)
	body.velocity.y = -200
	body.direction.y = 1
	body.floating = true
	#body.gravity *= -1
	


func _on_body_exited(body):
	print("Out")
	print(body.speed)
	body.direction.y = 0
	body.exited_floating = true
