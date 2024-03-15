extends State
class_name FloatingState

func handle_entered_vertical_wind() -> void:
	pass

func handle_exited_vertical_wind() -> void:
	if (lemming.velocity.y == 0 && lemming.is_on_floor()):
		self.exit_state.emit(WalkingState.new(self.lemming))
		return
	
	self.exit_state.emit(FreeFallState.new(self.lemming))

func handle_pushed_by_vertical_wind(vertical_direction: int, wind_force: int) -> void:
	if(lemming.is_mechanic):
		lemming.animation.play("fall_mechanic")
	elif(lemming.is_physicist):
		lemming.animation.play("fall_physicist")
	else:
		lemming.animation.play("fall")
	lemming.velocity.y += wind_force/3.0 * vertical_direction
	
	if (vertical_direction > 0):
		lemming.velocity.y = min(wind_force, lemming.velocity.y)
	else:
		lemming.velocity.y = max(-wind_force, lemming.velocity.y)

func update():
	pass
	
func physics_update(_delta: float):
	pass

func onEnter():
	lemming.set_speed(0)

func onExit():
	pass
