class_name Lemming extends CharacterBody2D

@export var direction : Vector2 = Vector2(1.0, 0.0)

#enum state {
#	JUMPING,
#	FALLING,
#	WALKING,
#	EXITING,
#	DYING
#}

#var state_machine: StateMachine = StateMachine.new()

const SPEED: float = 100.0
const jump_force: float = -750.0

@onready var collider_right: Area2D = %ColliderRight
@onready var collider_left: Area2D = %ColliderLeft

var initial_state: State = WalkingState.new(self)
var state_machine: StateMachine = StateMachine.new(initial_state)

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _process(_delta):
	state_machine.update()

func _physics_process(delta):
	state_machine.physics_update()
	move_and_slide()
	
