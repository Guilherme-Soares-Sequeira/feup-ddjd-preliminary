extends State
class_name FloatingState

#func _init(lemming: Lemming) -> void:
#	super(lemming)

func update():
	pass
	
func physics_update(_delta: float):
	if (lemming.is_on_floor()):
		exit_state.emit(WalkingState.new(lemming))
		return
	lemming.velocity.y = lemming.gravity / 2
	pass

func onEnter():
	print("Entered FloatingState")
	lemming.direction.y = 1
		#lemming.velocity.x = 0
	pass

func onExit():
	print("Exited FloatingState")
	lemming.direction.y = 0
	lemming.floating = false;
	lemming.exited_floating = false
	pass
