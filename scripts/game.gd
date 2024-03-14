extends Node2D

const level_1_scene = preload("res://scenes/level_1.tscn")

var int_to_level: Dictionary = {
	1: level_1_scene,
}

# OnReady vars
var UI: CanvasLayer
var hud: Hud
var level_container: Node2D
var main_menu: MainMenu

# Functions
func load_main_menu():
	self.hud.visible = false
	for child in self.level_container.get_children():
		child.queue_free()
	
	self.main_menu.visible = true

func load_level(level_num: int):
	if (not int_to_level.has(level_num)):
		printerr("Oops, level is not in dict level")
		return

	self.main_menu.visible = false
	self.hud.visible = true
		
	var level: Level = int_to_level[level_num].instantiate()
	
	for child in level_container.get_children():
		child.queue_free()
	
	# Set hud's initial status according to level
	## credit
	self.hud.set_needed_credit(level.get_needed_credit())
	self.hud.set_current_credit(0)
		## tools
	self.hud.set_current_coffee(level.get_initial_coffees())
	self.hud.set_current_mechanic(level.get_initial_mechanics())
	self.hud.set_current_physics_bachelor(level.get_initial_physics_bachelors())
	## escape
	self.hud.set_needed_escape(level.get_needed_escape())
	
	# Connect level to hud
	level.update_coffees.connect(self.hud.set_current_coffee)
	level.update_mechanics.connect(self.hud.set_current_mechanic)
	level.update_physics_bachelors.connect(self.hud.set_current_physics_bachelor)
	level.update_credit.connect(self.hud.set_current_credit)
	
	# Connect hud to level
	self.hud.select_coffee.connect(level.select_coffee)
	self.hud.select_mechanic.connect(level.select_mechanic)
	self.hud.select_physics_bachelor.connect(level.select_physics_bachelor)
	
	# Connect level to Game
	level.level_win.connect(self.load_main_menu)
	level.level_exit.connect(self.load_main_menu)	
	
	# Add level to tree
	level_container.add_child(level)

# Called when the node enters the scene tree for the first time.
func _ready():
	self.UI = %UI
	self.hud = %hud
	self.level_container = %LevelContainer
	self.main_menu = %MainMenu 
	
	self.main_menu.play_level_1.connect(self.load_level)
