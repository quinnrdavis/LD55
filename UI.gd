extends Control

@onready var minions = $"../Minions"
@onready var imp_button = $BoxContainer/ImpContainer/ImpButton
@onready var ape_button = $BoxContainer/VBoxContainer/ApeButton


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




func _on_button_pressed():
	get_tree().quit()


func _on_ape_button_pressed(button):
	spawn_minion.emit(button)

func _on_imp_button_pressed(button):
	spawn_minion.emit(button)
