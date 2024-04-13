extends Node2D

@onready var spawnPoint = $SpawnPoint
@onready var imp_timer = $ImpTimer
@onready var imp = preload("res://imp.tscn")

@onready var ui = $"../UI"



var imp_ready = true

func _ready():
	ui.connect("spawn_minion", spawn_minion)

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
