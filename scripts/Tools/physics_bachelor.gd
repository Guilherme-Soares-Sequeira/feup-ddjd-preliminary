class_name PhysicsBachelor extends Tool

var FrozenWaterScene =  preload("res://scenes/frozen_water.tscn")

func handle_enter_water(terrain: Node2D, water: Node2D):
	var frozen_water = FrozenWaterScene.instantiate()
	frozen_water.global_position = water.global_position
	water.queue_free()
	terrain.add_child(frozen_water)
