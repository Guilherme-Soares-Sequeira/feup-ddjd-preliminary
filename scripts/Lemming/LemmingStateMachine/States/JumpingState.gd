extends State
class_name JumpingState

var yspeed: float

#func _init(lemming: Lemming) -> void:
#	super(lemming)

func jump() -> void:
	yspeed = lemming.jump_force

func handle_left_click():
	jump() # Place holder, test

func update():
	pass
	
func physics_update(_delta: float):
	if (lemming.is_on_floor() && yspeed >= 0):
		exit_state.emit(WalkingState.new(lemming))
		return
	lemming.velocity.x = lemming.speed * lemming.direction.x
	lemming.velocity.y = yspeed
	yspeed += lemming.gravity / 23
	if(lemming.is_mechanic):
		lemming.animation.play("jump_mechanic")
	elif(lemming.is_physicist):
		lemming.animation.play("jump_physicist")
	else:
		lemming.animation.play("jump")

func onEnter():
	jump()

func onExit():
	pass
