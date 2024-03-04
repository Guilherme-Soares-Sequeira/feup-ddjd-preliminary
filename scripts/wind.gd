extends Area2D

var bodies_within=[] # saves bodies within the area which have "direction" property
		
func body_entered(body):
	print("here")
	if("speed" in body):
		print("in")
		bodies_within.append(body)
		body.direction = -body.direction
		body.speed = 200.0

func body_exited(body):
	if(body in bodies_within):
		print("exited")
		bodies_within.erase(body)
		body.speed = 100.0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass
	

func _on_body_entered(body):
	print("here")
	if("speed" in body):
		print("in")
		bodies_within.append(body)
		body.direction = -body.direction
		body.speed = 200.0


func _on_body_exited(body):
	if(body in bodies_within):
		print("exited")
		bodies_within.erase(body)
		body.speed = 100.0
