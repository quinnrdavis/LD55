extends Node2D

@onready var animation_player = $"../AnimationPlayer"
@onready var hitbox = $"../Hitbox"
@onready var health_bar = $Control/HealthBar
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
	health_bar.max_value = MAX_HEALTH
	health_bar.value = health
	health_bar.visible = true


func _on_hitbox_area_entered(area):
	hitbox.set_deferred("monitoring", false)
	animation_player.play("Attack")
	
	await animation_player.animation_finished
	if is_instance_valid(area) && is_instance_valid(parent):
		if area.get_parent().name.contains("Minions") or area.get_parent().name.contains("Enemies"):
			area.get_parent().take_damage(DAMAGE)
		else:
			area.get_parent().get_child(0).take_damage(DAMAGE)
