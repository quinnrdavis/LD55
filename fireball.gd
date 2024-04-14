extends RigidBody2D

@export var DAMAGE = 1

func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_body_entered(body):
	if body.name.contains("StaticBody"):
		queue_free()
	else:
		if get_contact_count() >= 2:
			queue_free()
		body.get_child(0).take_damage(DAMAGE)
