class_name PassedOutLemming extends RigidBody2D

# Constants
const HEIGHT: int = 128
const WIDTH: int = 100

# Fields

# Nodes
@onready var collision_shape = %CollisionShape2D
@onready var sprite = %Sprite2D

func _init():
	pass

func scale_sprite():
	var original_size = sprite.texture.get_size()

	var scale_x = WIDTH / (original_size.x / 2)
	var scale_y = HEIGHT / (original_size.y / 2)

	sprite.scale = Vector2(scale_x, scale_y)
	
# Called when the node enters the scene tree for the first time.
func _ready():
	@warning_ignore("integer_division")
	collision_shape.shape.extents = Vector2(WIDTH/8, HEIGHT/8)
	scale_sprite()
	self.set_pickable(true)
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass
