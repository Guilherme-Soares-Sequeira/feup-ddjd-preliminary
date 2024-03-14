extends State
class_name FreeFallState

func update():
	pass

func physics_update(delta: float):
	if (lemming.is_on_floor()):
		exit_state.emit(WalkingState.new(lemming))
		return

	lemming.apply_gravity(delta)

func onEnter():
	lemming.animation.play("fall")	

func onExit():
	pass
