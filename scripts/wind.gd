extends Area2D

@export var pointing_right: bool
@export var wind_force: int = 300
@export var collision_area: CollisionShape2D

var bodies_within = {} # saves bodies within the area and their original speed
var horizontal_direction: int

# Called when the node enters the scene tree for the first time.
func _ready():
	if self.pointing_right:
		self.horizontal_direction = 1
	else:
		self.horizontal_direction = -1
	

func _on_body_entered(body):
	print("[HORIZONTAL WIND] body_entered called.")
	if not body.has_method("set_speed") or not body.has_method("set_horizontal_direction"):
		printerr("[HORIZONTAL WIND]: " + str(body) + " does not have the necessary functions!")
		return
	
	bodies_within[body] = body.speed
	body.set_speed(max(self.wind_force, body.speed))
	body.set_horizontal_direction(self.horizontal_direction)


func _on_body_exited(body):
	print("[HORIZONTAL WIND] body_exited called.")
		
	if not body in bodies_within:
		printerr("[HORIZONTAL WIND]: Body that wasn't in bodies_within left the area - " + str(body))
		return
	
	body.speed = bodies_within[body]	
	bodies_within.erase(body)
