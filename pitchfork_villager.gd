extends CharacterBody2D

@export var SPEED = 1

func _ready():
	pass # Replace with function body.


func _process(delta):
	velocity.x = -SPEED
	move_and_collide(velocity)
