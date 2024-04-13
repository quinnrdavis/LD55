extends Node2D

@onready var spawnPoint = $SpawnPoint
@onready var imp_timer = $ImpTimer
@onready var imp = preload("res://imp.tscn")


var imp_ready = true

func _ready():
	pass # Replace with function body.



func _process(delta):
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
		if imp_ready == true:
			imp_ready = false
			imp_timer.start()
			var impInstance = imp.instantiate()
			add_child(impInstance)
			impInstance.global_position = spawnPoint.global_position


func _on_imp_timer_timeout():
	imp_ready = true
