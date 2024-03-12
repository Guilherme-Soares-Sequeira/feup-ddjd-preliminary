class_name MainMenu extends Control

signal play_level_1(level_num: int)

func _on_play_level_one_button_pressed():
	self.play_level_1.emit(1)
