extends Control

var global = Global

@onready var checkmark_1 = $VBoxContainer/HBoxContainer2/Checkmark1
@onready var checkmark_2 = $VBoxContainer/HBoxContainer2/Checkmark2
@onready var checkmark_3 = $VBoxContainer/HBoxContainer2/Checkmark3
@onready var checkmark_4 = $VBoxContainer/HBoxContainer2/Checkmark4
@onready var checkmark_5 = $VBoxContainer/HBoxContainer2/Checkmark5

func _ready():
	var levels_beaten = global.levels_beaten
	if levels_beaten.has(1):
		checkmark_1.z_index = 0
	if levels_beaten.has(2):
		checkmark_2.z_index = 0
	if levels_beaten.has(3):
		checkmark_3.z_index = 0
	if levels_beaten.has(4):
		checkmark_4.z_index = 0
	if levels_beaten.has(5):
		checkmark_5.z_index = 0

func _on_level_one_button_pressed():
	global.current_level = 1
	get_tree().change_scene_to_file("res://level1.tscn")


func _on_level_two_button_pressed():
	global.current_level = 2
	get_tree().change_scene_to_file("res://level2.tscn")


func _on_level_three_button_pressed():
	global.current_level = 3
	get_tree().change_scene_to_file("res://level3.tscn")


func _on_level_four_button_pressed():
	global.current_level = 4
	get_tree().change_scene_to_file("res://level4.tscn")


func _on_level_five_button_pressed():
	global.current_level = 5
	get_tree().change_scene_to_file("res://level5.tscn")
