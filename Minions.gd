extends Node2D

@export var TOWER_HEALTH = 50

var health
var imp_ready = true

@onready var spawnPoint = $SpawnPoint
@onready var imp_timer = $ImpTimer
@onready var imp = preload("res://imp.tscn")
@onready var ui = $"../UI"
@onready var tower_health_bar = $"../Minions/Tower/TowerHealthBar"


func _ready():
	ui.connect("spawn_minion", spawn_minion)
	health = TOWER_HEALTH
	tower_health_bar.max_value = TOWER_HEALTH
	tower_health_bar.value = health

func _process(delta):
	pass

func spawn_minion(minion):
	if imp_ready == true:
		imp_ready = false
		imp_timer.start()
		var impInstance = imp.instantiate()
		add_child(impInstance)
		impInstance.global_position = spawnPoint.global_position

func _on_imp_timer_timeout():
	imp_ready = true
