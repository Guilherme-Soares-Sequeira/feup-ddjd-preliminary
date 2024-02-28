class_name Lemming extends CharacterBody2D

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

# Constants
const DEFAULT_SPEED: float = 100.0
const DEFAULT_JUMP_FORCE: float = -788.0

# Fields
@export var direction : Vector2 = Vector2(1.0, 0.0)
var speed: float = DEFAULT_SPEED
var jump_force: float = DEFAULT_JUMP_FORCE

var initial_state: State = WalkingState.new(self)
var state_machine: StateMachine = StateMachine.new(initial_state)

# Nodes 
@onready var collider_right: Area2D = %ColliderRight
@onready var collider_left: Area2D = %ColliderLeft

# Constructor
func _init():
	pass

# Called when the lemming is added to the node tree
func _ready():
	self.set_pickable(true) # Allows the lemming to be clicked

func is_mouse_left_click(event: InputEvent):
	if not (event is InputEventMouseButton):
		return false
	
	var mouse_event := event as InputEventMouseButton
	return mouse_event.button_index == MOUSE_BUTTON_LEFT and mouse_event.pressed
	

# Handle lemming being clicked with the mouse
func _on_input_event(viewport, event, shape_idx):
	if not is_mouse_left_click(event):
		return
	
	state_machine.handle_left_click()
	

func _process(_delta):
	state_machine.update()

func _physics_process(delta):
	state_machine.physics_update()
	move_and_slide()
	



