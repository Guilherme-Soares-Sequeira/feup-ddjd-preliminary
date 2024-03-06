extends State
class_name DecelerationState

func update():
	pass

func physics_update(delta: float):
	lemming.velocity.y = lemming.velocity.y + lemming.gravity * delta
	
	if lemming.velocity.y >= 0:
		self.exit_state.emit(FallingState.new(self.lemming))

func onEnter():
	pass

func onExit():
	pass