class_name Fan extends StaticBody2D

@onready var sprite: Sprite2D = %Sprite2D

@export var vertical_wind: VerticalWind
@export var horizontal_wind: HorizontalWind

func handle_mechanic() -> void:
	if not vertical_wind == null:
		sprite.load("res://assets/vfan.png")
		vertical_wind.queue_free()
	if not horizontal_wind == null:
		horizontal_wind.queue_free()
