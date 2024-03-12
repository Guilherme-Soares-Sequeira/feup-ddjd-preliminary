class_name Level extends Node2D

signal level_win()
signal level_exit()
signal update_coffees(new_num: int)
signal update_debugs(new_num: int)
signal update_credit(new_num: int)

enum tools {
	NONE,
	COFFEE,
	DEBUG
}

@export var exit: Exit
@export var cheatsheets: Array[Cheatsheet]
@export var lemmings: Array[Lemming]
@export var needed_credit: int

@export var initial_coffees: int
@export var initial_debugs: int
var current_coffees
var current_debugs

var current_credit: int = 0

var selected_tool: tools = tools.NONE

func select_coffee():
	self.selected_tool = tools.COFFEE

func select_debug():
	self.selected_tool = tools.DEBUG

func increase_credit(credit: int):
	self.current_credit += credit
	
	if (self.current_credit >= self.needed_credit):
		self.exit.activate()
	
	self.update_credit.emit(self.current_credit)
	
func get_current_credit() -> int:
	return self.current_credit

func get_needed_credit() -> int:
	return self.needed_credit

func get_initial_coffees() -> int:
	return self.initial_coffees

func get_initial_debugs() -> int:
	return self.initial_debugs

# Called when the node enters the scene tree for the first time.
func _ready():
	self.current_coffees = self.initial_coffees
	self.current_debugs = self.initial_debugs
	
	for cs: Cheatsheet in self.cheatsheets:
		cs.picked_up.connect(increase_credit)
