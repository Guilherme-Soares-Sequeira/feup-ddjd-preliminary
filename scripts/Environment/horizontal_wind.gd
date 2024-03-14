class_name HorizontalWind extends Area2D

@export var pointing_right: bool = true
@export var wind_force: int = 300
@export var collision_area: CollisionShape2D

var horizontal_direction: int

# Called when the node enters the scene tree for the first time.
func _ready():
	if self.pointing_right:
		self.horizontal_direction = 1
	else:
		self.horizontal_direction = -1
	

func _physics_process(_delta):
	for body in get_overlapping_bodies():
		if not body.has_method("handle_pushed_by_horizontal_wind"):
			printerr("Body that does implement needed functions is in Horizontal Wind: " + str(body))
			continue
		
		body.handle_pushed_by_horizontal_wind(self.horizontal_direction, self.wind_force)
