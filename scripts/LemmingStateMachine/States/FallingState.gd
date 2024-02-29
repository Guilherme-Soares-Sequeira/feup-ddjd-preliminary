extends State
class_name FallingState

#func _init(lemming: Lemming) -> void:
#	super(lemming)

func update():
	pass
	
func physics_update(_delta: float):
	if (lemming.is_on_floor()):
		exit_state.emit(WalkingState.new(lemming))
		return
	
	lemming.velocity.y = lemming.gravity / 1.4
	pass

func onEnter():
	print("Entered FallingState")
	lemming.direction.y = 1
	lemming.velocity.x = 0
	pass

func onExit():
	print("Exited FallingState")
	lemming.direction.y = 0
	pass
