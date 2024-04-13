extends Control

@onready var minions = $"../Minions"
@onready var imp_button = $BoxContainer/ImpContainer/ImpButton


signal spawn_minion(minion)

func _process(delta):
	if minions.imp_ready == false:
		imp_button.disabled = true
	else:
		imp_button.disabled = false

func _on_texture_button_pressed(button):
	spawn_minion.emit(button)
