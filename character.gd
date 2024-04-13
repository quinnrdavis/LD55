extends Node2D

@onready var animation_player = $"../AnimationPlayer"
@onready var hitbox = $"../Hitbox"
@onready var parent = get_parent()


@export var SPEED = 1
@export var MAX_HEALTH = 3
@export var DAMAGE = 1

var health

func _ready():
	health = MAX_HEALTH


func _process(delta):
	parent.velocity.x = SPEED
	parent.move_and_collide(parent.velocity)


func take_damage(damage):
	health -= damage
	if health <= 0:
		parent.queue_free()


func _on_hitbox_area_entered(area):
	hitbox.set_deferred("monitoring", false)
	animation_player.play("Attack")
	
	await animation_player.animation_finished
	if is_instance_valid(area):
		area.get_parent().get_child(0).take_damage(DAMAGE)
