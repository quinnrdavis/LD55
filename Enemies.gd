extends Node2D

@export var VILLAGE_HEALTH = 25

var health
var enemy_spawns

@onready var spawnPoint = $SpawnPoint
@onready var village_health_bar = $VillageHealthBar
@onready var spawn_timer = $SpawnTimer
@onready var hit_sound = $HitSound

@onready var fork_villager = preload("res://pitchfork_villager.tscn")
@onready var torch_villager = preload("res://torch_villager.tscn")

var global = Global

func _ready():
	health = VILLAGE_HEALTH
	village_health_bar.max_value = VILLAGE_HEALTH
	village_health_bar.value = health

func spawn_villager():
	if enemy_spawns.size() > 0:
		var current_spawn = enemy_spawns[0]
		enemy_spawns.pop_front()
		var current_villager
		if current_spawn.x == 1:
			current_villager = fork_villager
		if current_spawn.x == 2:
			current_villager = torch_villager
		
		var instance = current_villager.instantiate()
		add_child(instance)
		instance.global_position = spawnPoint.global_position
		
		spawn_timer.wait_time = current_spawn.y
		spawn_timer.start()

func take_damage(damage):
	hit_sound.play()
	health -= damage
	village_health_bar.value = health
	if health <= 0:
		beat_level()

func beat_level():
	global.levels_beaten.push_back(global.current_level)
	get_tree().change_scene_to_file("res://success.tscn")

func _on_timer_timeout():
	spawn_villager()
