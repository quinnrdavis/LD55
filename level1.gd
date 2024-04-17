extends Node2D

@onready var ape_button = $UI/BoxContainer/MinionsContainer/ApeContainer/ApeButton
@onready var minions = $Minions
@onready var enemies = $Enemies
@onready var wand = $Minions/Wand
@onready var ice_button = $UI/BoxContainer/SpellsContainer/VBoxContainer/IceButton


var enemy_spawns = [Vector2(1,2),Vector2(1,2),Vector2(1,2),Vector2(1,2),Vector2(1,2),
				Vector2(1,2),Vector2(1,2),Vector2(1,2),Vector2(1,2),Vector2(1,2)]

func _ready():
	enemies.enemy_spawns = enemy_spawns
	enemies.spawn_villager()
	
	minions.ape_ready = false
	ape_button.disabled = true
	ape_button.tooltip_text = "Unlocked in Level 2"
	
	wand.ice_ready = false
	ice_button.disabled = true
	ice_button.tooltip_text = "Unlocked in Level 3"
	
