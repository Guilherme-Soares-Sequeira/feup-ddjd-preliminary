extends State
class_name StraightFallState

func update():
	pass
	
func physics_update(delta: float):
	if (lemming.is_on_floor()):
		exit_state.emit(WalkingState.new(lemming))
		return
	lemming.apply_gravity(delta)
	
func onEnter():
	lemming.set_speed(0)
	lemming.animation.play("fall")

func onExit():
	pass
