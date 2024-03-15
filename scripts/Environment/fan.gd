class_name Fan extends StaticBody2D

@export var vertical_wind: VerticalWind
@export var horizontal_wind: HorizontalWind

@onready var mesh_instance: MeshInstance2D = $MeshInstance2D

func handle_mechanic() -> void:
	if not vertical_wind == null:
		mesh_instance.modulate = Color(0.3, 0.3, 0.3)
		
		#sprite.load("res://assets/vfan.png")
		vertical_wind.queue_free()
	if not horizontal_wind == null:
		horizontal_wind.queue_free()
