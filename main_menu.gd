extends Control

var global = Global

@onready var mute_check = $VBoxContainer/HBoxContainer/MuteCheck

func _ready():
	if global.muted == true:
		mute_check.z_index = 0
	else:
		mute_check.z_index = -1

func _on_quit_button_pressed():
	get_tree().quit()


func _on_levels_button_pressed():
	get_tree().change_scene_to_file("res://levels.tscn")


func _on_mute_button_pressed():
	var bus_idx = AudioServer.get_bus_index("Master")
	if global.muted == false:
		AudioServer.set_bus_mute(bus_idx, true)
		global.muted = true
		mute_check.z_index = 0
	else:
		AudioServer.set_bus_mute(bus_idx, false)
		global.muted = false
		mute_check.z_index = -1
