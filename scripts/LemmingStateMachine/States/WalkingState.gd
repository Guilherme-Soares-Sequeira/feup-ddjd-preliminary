extends State
class_name WalkingState

func _init(lemming: Lemming):
	super(lemming)
	
func handle_left_click():
	exit_state.emit(JumpingState.new(lemming)) # place holder, test

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
	
func physics_update():
	if (not lemming.is_on_floor()):
		exit_state.emit(FallingState.new(lemming))
		return
		
	if (lemming.is_on_wall()):
		if (jump_or_turn()):
			exit_state.emit(JumpingState.new(lemming))
			return
	
	lemming.velocity.x = lemming.speed * lemming.direction.x	

func onEnter():
	print("Entered WalkingState")
	pass

func onExit():
	print("Exited WalkingState")	
	pass
