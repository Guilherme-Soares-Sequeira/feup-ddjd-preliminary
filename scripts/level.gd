class_name Level extends Node2D


signal level_win()
signal level_exit()

@export var exit: Exit
@export var cheatsheets: Array[Cheatsheet]
@export var lemmings: Array[Lemming]
@export var needed_credit: int

@export var coffees: int


var current_credit: int = 0

func increase_credit(score: int):
	self.current_score += score
	
	if (self.current_credit >= self.needed_credit):
		self.exit.activate()

# Called when the node enters the scene tree for the first time.
func _ready():
	for cs: Cheatsheet in self.cheatsheets:
		cs.picked_up.connect(increase_credit, CONNECT_ONE_SHOT)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
