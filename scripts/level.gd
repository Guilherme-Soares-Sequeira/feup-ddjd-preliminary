class_name Level extends Node2D

signal level_win()
signal level_exit()
signal update_coffees(new_num: int)
signal update_debugs(new_num: int)
signal update_physics_bachelors(new_num: int)
signal update_credit(new_num: int)


@export var exit: Exit
@export var cheatsheets: Array[Cheatsheet]
@export var lemmings: Array[Lemming]

@export var needed_credit: int
var current_credit: int = 0
@export var needed_escape: int = 1
var current_escaped: int = 0

# Number of lemmings that need to escape

func get_needed_escape() -> int:
	return self.needed_escape

func increase_current_escaped() -> void:
	self.current_escaped += 1
	
	if (self.current_escaped >= self.needed_escape):
		self.level_win.emit()

# TOOLS

enum tools {
	NONE,
	COFFEE,
	DEBUG,
	PHYSICS
}

var selected_tool: tools = tools.NONE

@export var initial_coffees: int
@export var initial_debugs: int
@export var initial_physics_bachelors: int
var current_coffees: int
var current_debugs: int
var current_physics_bachelors: int

## Selects
func select_coffee():
	self.selected_tool = tools.COFFEE

func select_debug():
	self.selected_tool = tools.DEBUG

func select_physics_bachelor():
	self.selected_tool = tools.PHYSICS

## Getters

func get_initial_coffees() -> int:
	return self.initial_coffees

func get_initial_debugs() -> int:
	return self.initial_debugs

func get_initial_physics_bachelors() -> int:
	return self.initial_physics_bachelors

## Setters

func set_current_coffees(new_coffees: int) -> void:
	self.current_coffees = new_coffees
	self.update_coffees.emit(self.current_coffees)

func set_current_debugs(new_debugs: int) -> void:
	self.current_debugs = new_debugs
	self.update_debugs.emit(self.current_debugs)

func set_current_physics_bachelors(new_physics_bachelors: int) -> void:
	self.current_physics_bachelors = new_physics_bachelors
	self.update_physics_bachelors.emit(self.current_physics_bachelors)

## Decreasers

func decrease_current_coffees() -> void:
	self.current_coffees -= 1
	self.update_coffees.emit(self.current_coffees)

func decrease_current_debugs() -> void:
	self.current_debugs -= 1
	self.update_debugs.emit(self.current_debugs)

func decrease_current_physics_bachelors() -> void:
	self.current_physics_bachelors -= 1
	self.update_physics_bachelors.emit(self.current_physics_bachelors)

# Credit

func increase_credit(credit: int):
	self.current_credit += credit
	
	if (self.current_credit >= self.needed_credit):
		self.exit.activate()
	
	self.update_credit.emit(self.current_credit)
	
func get_current_credit() -> int:
	return self.current_credit

func get_needed_credit() -> int:
	return self.needed_credit

# Other

## Getters
func get_terrain_node() -> Node2D:
	return $Terrain

# Called when the node enters the scene tree for the first time.
func _ready():
	self.current_coffees = self.initial_coffees
	self.current_debugs = self.initial_debugs
	current_physics_bachelors = initial_physics_bachelors
	
	for cs: Cheatsheet in self.cheatsheets:
		cs.picked_up.connect(increase_credit)
	
	for lem: Lemming in self.lemmings:
		lem.coffee_used.connect(self.decrease_current_coffees)
		lem.debug_used.connect(self.decrease_current_debugs)
		lem.physics_used.connect(decrease_current_physics_bachelors)
	
	exit.lemming_exited.connect(increase_current_escaped)
