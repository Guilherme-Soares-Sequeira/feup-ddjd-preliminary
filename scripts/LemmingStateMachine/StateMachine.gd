extends Node

class_name StateMachine

var current_state: State

func _init(initial_state: State):
	current_state = initial_state

func _ready():
	pass

func update():
	if not current_state: return
	current_state.update()
	
func physics_update():
	if not current_state: return
	current_state.physics_update()
	

func transition_to(state: State):
	if current_state:
		current_state.onExit()
	current_state = state
	current_state.onEnter()
