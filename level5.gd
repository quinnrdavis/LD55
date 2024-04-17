extends Node2D

@onready var ape_button = $UI/BoxContainer/MinionsContainer/ApeContainer/ApeButton
@onready var minions = $Minions
@onready var enemies = $Enemies
@onready var wand = $Minions/Wand
@onready var ice_button = $UI/BoxContainer/SpellsContainer/VBoxContainer/IceButton


var enemy_spawns = [Vector2(2,1),Vector2(1,3),Vector2(2,1),Vector2(1,3),Vector2(2,1),
				Vector2(1,2),Vector2(2,1),Vector2(1,1),Vector2(2,1),Vector2(1,1),
				Vector2(1,2),Vector2(2,1),Vector2(1,2),Vector2(2,1),Vector2(2,1),
				Vector2(1,2),Vector2(2,1),Vector2(1,2),Vector2(2,1),Vector2(1,1),
				Vector2(1,1),Vector2(2,1),Vector2(1,1),Vector2(2,1),Vector2(1,1),
				Vector2(2,1),Vector2(1,1),Vector2(2,1),Vector2(1,1),Vector2(2,1),
				Vector2(1,1),Vector2(2,1),Vector2(1,1),Vector2(2,1),Vector2(1,1)]

func _ready():
	enemies.enemy_spawns = enemy_spawns
	enemies.spawn_villager()
