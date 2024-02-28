extends Node
class_name State 

signal exit_state(new_state: State)

var lemming: Lemming

func _init(_lemming: Lemming):
	lemming = _lemming

func handle_left_click():
	pass

func update():
	pass
	
func physics_update():
	pass

func onEnter():
	pass

func onExit():
	pass
