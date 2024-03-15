extends State
class_name StraightFallState

func update():
	pass
	
func physics_update(delta: float):
	if (lemming.is_on_floor()):
		exit_state.emit(WalkingState.new(lemming))
		return
	lemming.apply_gravity(delta)
	if(lemming.is_mechanic):
		lemming.animation.play("fall_mechanic")
	elif(lemming.is_physicist):
		lemming.animation.play("fall_physicist")
	else:
		lemming.animation.play("fall")
	
func onEnter():
	lemming.set_speed(0)

func onExit():
	pass
