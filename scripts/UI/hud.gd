class_name Hud extends Control

signal select_coffee()
signal select_mechanic()
signal select_physics_bachelor()

@onready var coffee_label = %CoffeeLabel
@onready var coffee_button = %CoffeeButton
@onready var mechanic_label = %MechanicLabel
@onready var mechanic_button = %MechanicButton
@onready var physics_bachelor_label = %PhysicsBachelorLabel
@onready var physics_bachelor_button = %PhysicsBachelorButton
@onready var current_credit = %CurrentCredit
@onready var needed_credit = %NeededCredit
@onready var current_escaped = %CurrentEscaped
@onready var needed_escape = %NeededEscape

func get_current_credit() -> int:
	return int(current_credit.text)

func set_current_credit(curr_credit: int) -> void:
	print(curr_credit)
	current_credit.text = str(curr_credit)

func get_needed_credit() -> int:
	return int(needed_credit.text)

func set_needed_credit(need_credit: int) -> void:
	needed_credit.text = str(need_credit)

func get_current_escaped() -> int:
	return int(current_escaped.text)

func set_current_escaped(new_current: int) -> void:
	current_escaped.text = str(new_current)

func get_needed_escaped() -> int:
	return int(needed_escape.text)

func set_needed_escape(new_needed: int) -> void:
	needed_escape.text = str(new_needed)
	
func get_current_coffee() -> int:
	return int(coffee_label.text)

func set_current_coffee(curr_coffee: int) -> void:
	print(curr_coffee)
	coffee_label.text = str(curr_coffee)
	
func _on_coffee_button_pressed():
	select_coffee.emit()

func get_current_mechanic() -> int:
	return int(mechanic_label.text)

func set_current_mechanic(curr_mechanic: int) -> void:
	mechanic_label.text = str(curr_mechanic)

func _on_mechanic_button_pressed():
	select_mechanic.emit()

func get_current_physics_bachelor() -> int:
	return int(physics_bachelor_label.text)

func set_current_physics_bachelor(curr_physics_bachelor: int) -> void:
	physics_bachelor_label.text = str(curr_physics_bachelor)
	
func _on_physics_bachelor_button_pressed():
	select_physics_bachelor.emit()
