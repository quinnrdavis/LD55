extends Control

var global = Global

func _on_main_menu_button_pressed():
	get_tree().change_scene_to_file("res://main_menu.tscn")



func _on_retry_button_pressed():
	var current_level = global.current_level
	match current_level:
		1:
			get_tree().change_scene_to_file("res://level1.tscn")
		2:
			get_tree().change_scene_to_file("res://level2.tscn")
		3:
			get_tree().change_scene_to_file("res://level3.tscn")
		4:
			get_tree().change_scene_to_file("res://level4.tscn")
		5:
			get_tree().change_scene_to_file("res://level5.tscn")
