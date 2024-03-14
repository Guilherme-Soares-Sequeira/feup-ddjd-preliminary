class_name Lemming extends CharacterBody2D

var PassedOutLemmingScene =  preload("res://scenes/passedOutLemming.tscn")

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

# Constants
const HEIGHT: int = 128
const WIDTH: int = 100
const DEFAULT_SPEED: float = 100.0
const DEFAULT_JUMP_FORCE: float = -788.0

# Fields
@export var level: Level
@export var direction : Vector2 = Vector2(1, 0)
var is_sleeping = true
var tool = null
var speed: float = DEFAULT_SPEED
var jump_force: float = DEFAULT_JUMP_FORCE
var floating = false;
var exited_floating = false;
var is_on_water = false;

var initial_state: State = AsleepState.new(self)
var state_machine: StateMachine = StateMachine.new(initial_state)

# Signals

signal coffee_used()
signal debug_used()

# Nodes 
@onready var collider_right: Area2D = %ColliderRight
@onready var collider_left: Area2D = %ColliderLeft
@onready var main_body: CollisionShape2D = %MainBody
@onready var sprite: Sprite2D = %Sprite2D
@onready var animation = self.get_node_or_null("AnimationPlayer")

# Constructor
func _init():
	pass

func scale_sprite():
	var original_size = sprite.texture.get_size()

	var scale_x = WIDTH / (original_size.x / 7)
	var scale_y = HEIGHT / (original_size.y / 7)

	sprite.scale = Vector2(scale_x, scale_y)

func set_horizontal_direction(new_direction: float):
	self.direction.x = new_direction
	# turn sprite and other logic if needed

func set_speed(new_speed: float):
	self.speed = new_speed

	if (self.speed < 0):
		self.speed *= -1
		self.set_horizontal_direction(-self.direction.x)
	
	self.update_x_velocity()
	# other logic if needed

func update_x_velocity():
	self.velocity.x = self.speed * self.direction.x

func apply_gravity(delta):
	self.velocity.y = min(self.gravity, self.velocity.y + self.gravity * delta)

func apply_horizontal_friction(delta: float):
	if (self.speed > self.DEFAULT_SPEED):
		self.set_speed(max(self.speed - 200 * delta, self.DEFAULT_SPEED))

# Environment Handlers

func handle_entered_vertical_wind():
	self.state_machine.handle_entered_vertical_wind()

func handle_exited_vertical_wind():
	self.state_machine.handle_exited_vertical_wind()

func handle_pushed_by_vertical_wind(vertical_direction: int, wind_force: int) -> void:
	self.state_machine.handle_pushed_by_vertical_wind(vertical_direction, wind_force)

func handle_pushed_by_horizontal_wind(horizontal_direction: int, wind_force: int) -> void:
	self.state_machine.handle_pushed_by_horizontal_wind(horizontal_direction, wind_force)

func handle_enter_water(water):
	if self.tool != null and self.tool.has_method("handle_enter_water"):
		self.tool.handle_enter_water(water)
	else:
		pass_out()

func handle_exit():
	queue_free()

# Tools

func is_mouse_left_click(event: InputEvent):
	if not (event is InputEventMouseButton):
		return false
	
	var mouse_event := event as InputEventMouseButton
	return mouse_event.button_index == MOUSE_BUTTON_LEFT and mouse_event.pressed

# Handle lemming being clicked with the mouse
func _on_input_event(_viewport, event, _shape_idx):
	if not is_mouse_left_click(event):
		return
	
	self.apply_tool(self.level.selected_tool)

func apply_tool(new_tool: Level.tools):
	match new_tool:
		Level.tools.NONE:
			pass
		Level.tools.DEBUG:
			
			if level.current_debugs <= 0 || self.tool != level.tools.NONE:
				return
			self.tool = 1 # Placeholder
			self.debug_used.emit()

		Level.tools.COFFEE:
			if level.current_coffees <= 0 || not self.is_sleeping:
				return
			self.wake_up()
			self.coffee_used.emit()
			
	# other logic (update sprite?)
	return

func wake_up():
	self.is_sleeping = false
	self.state_machine.transition_to(WalkingState.new(self))

func pass_out():
	# Create an instance of the PassedOutLemming scene
	var passed_out_lemming: PassedOutLemming = PassedOutLemmingScene.instantiate()
	
	get_parent().add_child(passed_out_lemming)
	passed_out_lemming.global_position = self.global_position
	passed_out_lemming.apply_central_impulse(Vector2(0, -100))
	passed_out_lemming.angular_velocity = 5.7 * direction.x
	
	# Remove the lemming that just passed out
	self.queue_free()

# Called when the lemming is added to the node tree
func _ready():
	main_body.shape.extents = Vector2(WIDTH/2.0, HEIGHT/2.0)
	scale_sprite()
	
	self.set_pickable(true) # Allows the lemming to be clicked

func _process(_delta):
	state_machine.update()

func _physics_process(delta):
	sprite.flip_h = (self.direction.x == -1)
	state_machine.physics_update(delta)
	move_and_slide()
	
