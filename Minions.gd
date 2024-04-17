extends Node2D

@export var TOWER_HEALTH = 40

var health
var imp_ready = true
var ape_ready = true

@onready var spawnPoint = $SpawnPoint
@onready var imp_timer = $ImpTimer
@onready var imp = preload("res://imp.tscn")
@onready var ape_timer = $ApeTimer
@onready var ape = preload("res://ape.tscn")
@onready var ui = $"../UI"
@onready var tower_health_bar = $"../Minions/Tower/TowerHealthBar"
@onready var hit_sound = $HitSound



func _ready():
	ui.connect("spawn_minion", spawn_minion)
	health = TOWER_HEALTH
	tower_health_bar.max_value = TOWER_HEALTH
	tower_health_bar.value = health

func _process(delta):
	pass

func spawn_minion(minion):
	match minion:
		"imp":
			if imp_ready == true:
				imp_ready = false
				imp_timer.start()
				var impInstance = imp.instantiate()
				add_child(impInstance)
				impInstance.global_position = spawnPoint.global_position
		"ape":
			if ape_ready == true:
				ape_ready = false
				ape_timer.start()
				var apeInstance = ape.instantiate()
				add_child(apeInstance)
				apeInstance.global_position = spawnPoint.global_position

func take_damage(damage):
	hit_sound.play()
	health -= damage
	tower_health_bar.value = health
	if health <= 0:
		game_over()

func game_over():
	get_tree().change_scene_to_file("res://game_over.tscn")

func _on_imp_timer_timeout():
	imp_ready = true


func _on_ape_timer_timeout():
	ape_ready = true
