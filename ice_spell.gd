extends Area2D

var global = Global

@onready var wand = $"../Minions/Wand"
@onready var ice_effect = preload("res://ice_effect.tscn")

func _process(delta):
	if get_global_mouse_position().y < 483 && wand.ice_ready == true:
		global_position = get_global_mouse_position()
		visible = true
		if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
			if wand.ice_ready == true:
				cast_ice()
	else:
		visible = false
	
	if global.selected_spell != "Ice":
		queue_free()

func cast_ice():
	wand.ice_ready = false
	monitoring = true
	wand.ice_timer.start()
	
	await get_tree().create_timer(0.1).timeout
	monitoring = false

func _on_area_entered(area):
	set_deferred("monitoring", false)
	var villager = area.get_parent()
	villager.get_child(0).iced = true
	var instance = ice_effect.instantiate()
	villager.add_child(instance)
	instance.global_position = villager.global_position
