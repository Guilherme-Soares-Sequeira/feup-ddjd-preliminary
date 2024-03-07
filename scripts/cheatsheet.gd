class_name Cheatsheet extends Area2D

signal picked_up(score: int)

@export var credit_score: int = 30

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_body_entered(body):
	self.picked_up.emit(self.credit_score)
