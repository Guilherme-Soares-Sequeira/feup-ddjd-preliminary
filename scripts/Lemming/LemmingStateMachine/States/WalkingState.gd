extends State
class_name WalkingState

func jump_or_turn() -> bool:
	var collision = lemming.get_last_slide_collision()
	if (collision.get_collider().is_in_group("lemmings")):
		var other_lemming: Lemming = collision.get_collider()
		
		if ((lemming.global_position.x < other_lemming.global_position.x && lemming.direction.x == 1 && other_lemming.direction.x == -1) || (lemming.global_position.x > other_lemming.global_position.x && lemming.direction.x == -1 && other_lemming.direction.x == 1)):
			lemming.direction.x = -lemming.direction.x
			other_lemming.direction.x = -other_lemming.direction.x
			return false
		elif lemming.direction.x != other_lemming.direction.x:
			return false
		
	
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
	if(lemming.is_mechanic):
		lemming.animation.play("walk_mechanic")
	elif(lemming.is_physicist):
		lemming.animation.play("walk_physicist")
	else:
		lemming.animation.play("walk")


func onEnter():
	lemming.set_speed(max(lemming.speed, lemming.DEFAULT_SPEED))	

func onExit():
	pass
