class_name Level extends Node2D


signal level_win()
signal level_exit()

@export var exit: Exit
@export var cheatsheets: Array[Cheatsheet]
@export var lemmings: Array[Lemming]
@export var needed_credit: int

var current_score: int = 0




# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
