extends Node
class_name State 

signal exit(new_state: State)

var lemming: Lemming

func _init(_lemming: Lemming):
	lemming = _lemming

func update():
	pass
	
func physics_update():
	pass

func onEnter():
	pass

func onExit():
	pass
