extends State
class_name JumpingState

var yspeed: float

func _init(lemming: Lemming):
	super(lemming)

func update():
	pass
	
func physics_update():
	if (lemming.is_on_floor() && yspeed >= 0):
		exit.emit(WalkingState.new(lemming))
		return
	lemming.velocity.x = lemming.SPEED * lemming.direction.x
	lemming.velocity.y = yspeed
	yspeed += lemming.gravity / 23

func onEnter():
	print("Entered JumpingState")
	yspeed = lemming.jump_force	

func onExit():
	print("Exited JumpingState")
	pass
