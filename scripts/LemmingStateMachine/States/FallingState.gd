extends State
class_name FallingState

#func _init(lemming: Lemming) -> void:
#	super(lemming)

func update():
	pass
	
func physics_update(delta: float):
	if (lemming.is_on_floor()):
		exit_state.emit(WalkingState.new(lemming))
		return
	lemming.apply_gravity(delta)
	
func onEnter():
	lemming.velocity.x = 0
	pass

func onExit():
	pass
