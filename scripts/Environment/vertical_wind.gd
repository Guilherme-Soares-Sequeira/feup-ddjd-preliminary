class_name VerticalWind extends Area2D

@export var collision_area: CollisionShape2D

@export var wind_force: int = 300
@export var pointing_up: bool = true

var wind_direction: int

# Called when the node enters the scene tree for the first time.
func _ready():
	if self.pointing_up:
		self.wind_direction = -1
	else:
		self.wind_direction = 1

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

func _on_body_entered(body):
	print("body entered")
	if not body.has_method("handle_entered_vertical_wind"):
		printerr("Body that does implement needed functions entered Vertical Wind: " + str(body))
		return
	
	body.handle_entered_vertical_wind()

func _on_body_exited(body):
	print("body exited")
	if not body.has_method("handle_exited_vertical_wind"):
		printerr("Body that does implement needed functions entered Vertical Wind: " + str(body))
		return
	body.handle_exited_vertical_wind()

func _physics_process(_delta):
	for body in get_overlapping_bodies():
		if not body.has_method("handle_pushed_by_vertical_wind"):
			printerr("Body that does implement needed functions is inside Vertical Wind: " + str(body))
			continue
		body.handle_pushed_by_vertical_wind(self.wind_direction, self.wind_force)
