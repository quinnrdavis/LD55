extends Node2D




func _on_ice_duration_timeout():
	queue_free()
	var character_component = get_parent().get_child(0)
	character_component.iced = false
	character_component.hitbox.set_deferred("monitoring", true)
