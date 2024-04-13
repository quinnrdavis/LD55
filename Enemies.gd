extends Node2D

@onready var spawnPoint = $SpawnPoint
@onready var forkvillager = preload("res://pitchfork_villager.tscn")



func _on_timer_timeout():
	var forkInstance = forkvillager.instantiate()
	add_child(forkInstance)
	forkInstance.global_position = spawnPoint.global_position
