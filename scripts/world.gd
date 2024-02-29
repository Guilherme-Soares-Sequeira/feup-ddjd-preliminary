extends Node2D

var LemmingScene: PackedScene = preload("res://scenes/lemming.tscn")


func is_mouse_right_click(event: InputEvent):
	if not (event is InputEventMouseButton):
		return false
	
	var mouse_event := event as InputEventMouseButton
	return mouse_event.button_index == MOUSE_BUTTON_RIGHT and mouse_event.pressed

# NOTE - This is debug only.
func _unhandled_input(event):
	if (not is_mouse_right_click(event)):
		return
	var m_event = event as InputEventMouseButton
	var lemming: Lemming = LemmingScene.instantiate()
	lemming.global_position = m_event.global_position
	add_child(lemming)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
