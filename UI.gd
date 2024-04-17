extends Control

var global = Global

@onready var minions = $"../Minions"
@onready var imp_button = $BoxContainer/MinionsContainer/ImpContainer/ImpButton
@onready var ape_button = $BoxContainer/MinionsContainer/ApeContainer/ApeButton
@onready var fireball_selection = $BoxContainer/SpellsContainer/FireballContainer/FireballSelection
@onready var ice_selection = $BoxContainer/SpellsContainer/VBoxContainer/IceSelection
@onready var ice_spell = preload("res://ice_spell.tscn")


signal spawn_minion(minion)

func _process(delta):
	if minions.imp_ready == false:
		imp_button.disabled = true
	else:
		imp_button.disabled = false
	if minions.ape_ready == false:
		ape_button.disabled = true
	else:
		ape_button.disabled = false
	
	var selected_spell = global.selected_spell
	match selected_spell:
		"Fireball":
			fireball_selection.z_index = 0
			ice_selection.z_index = -1
		"Ice":
			fireball_selection.z_index = -1
			ice_selection.z_index = 0


func _on_ape_button_pressed(button):
	spawn_minion.emit(button)

func _on_imp_button_pressed(button):
	spawn_minion.emit(button)


func _on_menu_button_pressed():
	get_tree().change_scene_to_file("res://main_menu.tscn")

func _on_fireball_button_pressed():
	global.selected_spell = "Fireball"


func _on_ice_button_pressed():
	var instance = ice_spell.instantiate()
	get_parent().add_child(instance)
	global.selected_spell = "Ice"

