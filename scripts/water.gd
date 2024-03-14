extends Area2D

var bodies_within = []

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _on_body_entered(body):
	print("water")
	bodies_within.append(body)
	body.gravity = body.gravity / 3
	body.is_on_water = true
