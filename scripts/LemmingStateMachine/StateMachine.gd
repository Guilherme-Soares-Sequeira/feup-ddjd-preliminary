extends Node

class_name StateMachine

var current_state: State

func _init(initial_state: State):
	current_state = initial_state
	current_state.exit_state.connect(transition_to)

func _ready():
	pass

func handle_left_click() -> void:
	current_state.handle_left_click()

func handle_entered_vertical_wind() -> void:
	self.current_state.handle_entered_vertical_wind()

func handle_exited_vertical_wind() -> void:
	self.current_state.handle_exited_vertical_wind()

func handle_pushed_by_wind(vertical_direction: int, wind_force: int) -> void:
	self.current_state.handle_pushed_by_wind(vertical_direction, wind_force)

func update():
	if not current_state:
		printerr("[StateMachine] No current state.")
		return

	current_state.update()
	
func physics_update(delta: float):
	if not current_state: return
	current_state.physics_update(delta)

func transition_to(state: State):
	if current_state:
		current_state.onExit()
		current_state.queue_free()
	
	current_state = state
	state.exit_state.connect(transition_to)
	current_state.onEnter()
