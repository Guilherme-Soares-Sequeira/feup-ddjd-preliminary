extends Node
class_name State 

signal exit_state(new_state: State)

var lemming: Lemming

func _init(_lemming: Lemming):
	lemming = _lemming

func handle_left_click():
	pass

func handle_entered_vertical_wind() -> void:
	self.exit_state.emit(FloatingState.new(self.lemming))

func handle_exited_vertical_wind() -> void:
	self.exit_state.emit(WalkingState.new(self.lemming))

func handle_pushed_by_wind(_vertical_direction: int, _wind_force: int) -> void:
	self.exit_state.emit(FloatingState.new(self.lemming))

func update():
	pass
	
func physics_update(_delta: float):
	pass

func onEnter():
	pass

func onExit():
	pass
