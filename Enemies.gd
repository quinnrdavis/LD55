extends Node2D

@export var VILLAGE_HEALTH = 25

var health

@onready var spawnPoint = $SpawnPoint
@onready var forkvillager = preload("res://pitchfork_villager.tscn")
@onready var village_health_bar = $VillageHealthBar

func _ready():
	health = VILLAGE_HEALTH
	village_health_bar.max_value = VILLAGE_HEALTH
	village_health_bar.value = health

func take_damage(damage):
	health -= damage
	village_health_bar.value = health

func _on_timer_timeout():
	var forkInstance = forkvillager.instantiate()
	add_child(forkInstance)
	forkInstance.global_position = spawnPoint.global_position
