extends Sprite2D

@export var FIREBALL_SPEED = 1000

var global = Global

@onready var fireball = preload("res://fireball.tscn")
@onready var spawn_point = $SpawnPoint
@onready var fireball_timer = $FireballTimer
@onready var ice_timer = $IceTimer

var fireball_ready = true
var ice_ready = true

func _process(delta):
	look_at(get_global_mouse_position())
	if get_global_mouse_position().y < 483:
		if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
			cast_spell()

func cast_spell():
	var selected_spell = global.selected_spell
	match selected_spell:
		"Fireball":
			if fireball_ready:
				fireball_ready = false
				fireball_timer.start()
				var instance = fireball.instantiate()
				get_parent().add_child(instance)
				instance.global_position = spawn_point.global_position
				var initial_velocity = Vector2(1, 0).rotated(rotation - deg_to_rad(10)) * FIREBALL_SPEED
				instance.linear_velocity = initial_velocity
		"Ice":
			pass

func _on_fireball_timer_timeout():
	fireball_ready = true

func _on_ice_timer_timeout():
	ice_ready = true
