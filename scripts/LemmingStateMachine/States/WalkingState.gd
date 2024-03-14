extends State
class_name WalkingState

func jump_or_turn() -> bool:
	if (lemming.direction.x > 0):
		if (not lemming.collider_right.has_overlapping_bodies()):
			return true
	else:
		if (not lemming.collider_left.has_overlapping_bodies()):
			return true
	
	lemming.direction.x = -lemming.direction.x
	return false
	
func update():
	pass
	
func physics_update(delta: float):
	if (not lemming.is_on_floor() && not lemming.floating && not lemming.exited_floating):
		exit_state.emit(StraightFallState.new(lemming))
		return
		
	if (lemming.is_on_wall()):
		if (jump_or_turn()):
			exit_state.emit(JumpingState.new(lemming))
			return

	lemming.update_x_velocity()
	lemming.apply_horizontal_friction(delta)
	#print(lemming.get_node_or_null("AnimationPlayer"))


func onEnter():
	lemming.set_speed(max(lemming.speed, lemming.DEFAULT_SPEED))
	lemming.animation.play("walk")	

func onExit():
	pass
