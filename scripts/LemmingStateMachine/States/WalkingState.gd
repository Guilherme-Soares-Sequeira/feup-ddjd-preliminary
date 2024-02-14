extends State
class_name WalkingState

func _init(lemming: Lemming):
	super(lemming)

func jump_or_turn() -> bool:
	if (lemming.direction.x > 0):
		if (not lemming.collider_right.has_overlapping_bodies()):
			lemming.velocity.y = lemming.jump_force
			return true
	else:
		if (not lemming.collider_left.has_overlapping_bodies()):
			lemming.velocity.y = lemming.jump_force
			return true
	
	lemming.direction.x = -lemming.direction.x
	return false
	
func update():
	pass
	
func physics_update():
	if (not lemming.is_on_floor()):
		exit.emit(FallingState.new(lemming))
		return
		
	if (lemming.is_on_wall()):
		if (jump_or_turn()):
			# Change to jumping state
			return
	
	lemming.velocity.x = lemming.SPEED * lemming.direction.x	

func onEnter():
	pass

func onExit():
	pass
