extends CharacterBody2D

@export var SPEED = -1
@export var MAX_HEALTH = 3
@export var DAMAGE = 2

var health

func _ready():
	health = MAX_HEALTH


func _process(delta):
	velocity.x = SPEED
	move_and_collide(velocity)


func take_damage(damage):
	health -= damage
	if health <= 0:
		queue_free()
