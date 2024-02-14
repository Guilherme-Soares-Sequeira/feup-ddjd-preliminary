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

const SPEED: float = 200.0
const jump_force: float = -750.0

@onready var collider_right: Area2D = %ColliderRight
@onready var collider_left: Area2D = %ColliderLeft

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity") * 18



func move_horizontally():
	velocity.x = direction.x * SPEED

func _physics_process(delta):
	
	if not is_on_floor():
		velocity.y = gravity * delta
	else:
		move_horizontally()
	
	move_and_slide()
	
