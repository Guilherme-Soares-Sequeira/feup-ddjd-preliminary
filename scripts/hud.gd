class_name Hud extends Control

signal select_coffee()
signal select_debug()

@onready var coffee_label = %CoffeeLabel
@onready var coffee_button = %CoffeeButton
@onready var debug_label = %DebugLabel
@onready var debug_button = %DebugButton
@onready var current_credit = %CurrentCredit
@onready var needed_credit = %NeededCredit
@onready var current_escaped = %CurrentEscaped
@onready var needed_escape = %NeededEscape

func get_current_credit() -> int:
	return int(current_credit.text)

func set_current_credit(curr_credit: int) -> void:
	current_credit.text = str(curr_credit)

func get_needed_credit() -> int:
	return int(needed_credit.text)

func set_needed_credit(need_credit: int) -> void:
	needed_credit.text = str(need_credit)

func get_current_coffee() -> int:
	return int(coffee_label.text)

func set_current_coffee(curr_coffee: int) -> void:
	coffee_label.text = str(curr_coffee)

func get_current_escaped() -> int:
	return int(current_escaped.text)

func set_current_escaped(new_current: int) -> void:
	current_escaped.text = str(new_current)

func get_needed_escaped() -> int:
	return int(needed_escape.text)

func set_needed_escape(new_needed: int) -> void:
	needed_escape.text = str(new_needed)

func _on_coffee_button_pressed():
	select_coffee.emit()

func get_current_debug() -> int:
	return int(debug_label.text)

func set_current_debug(curr_debug: int) -> void:
	debug_label.text = str(curr_debug)

func _on_debug_button_pressed():
	select_debug.emit()
