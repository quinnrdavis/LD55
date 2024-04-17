extends Control

var global = Global

@onready var next_level_button = $VBoxContainer/NextLevelButton
@onready var you_win = $VBoxContainer/YouWin


func _ready():
	if global.current_level == 5:
		next_level_button.visible = false
		you_win.visible = true

func _on_main_menu_button_pressed():
	get_tree().change_scene_to_file("res://main_menu.tscn")


func _on_next_level_button_pressed():
	match global.current_level:
		1:
			global.current_level = 2
			get_tree().change_scene_to_file("res://level2.tscn")
		2:
			global.current_level = 3
			get_tree().change_scene_to_file("res://level3.tscn")
		3:
			global.current_level = 4
			get_tree().change_scene_to_file("res://level4.tscn")
		4:
			global.current_level = 5
			get_tree().change_scene_to_file("res://level5.tscn")
