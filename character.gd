extends Node2D

var iced = false

@onready var animation_player = $"../AnimationPlayer"
@onready var hitbox = $"../Hitbox"
@onready var health_bar = $Control/HealthBar
@onready var parent = get_parent()
@onready var hit_sound = $HitSound


@export var SPEED = 1
@export var MAX_HEALTH = 3
@export var DAMAGE = 1

var health

func _ready():
	health = MAX_HEALTH


func _process(delta):
	if iced == false:
		parent.velocity.x = SPEED
		parent.move_and_collide(parent.velocity)
	else:
		parent.velocity = Vector2.ZERO
		animation_player.play("RESET")
		hitbox.set_deferred("monitoring", false)


func take_damage(damage):
	hit_sound.play()
	health -= damage
	if health <= 0:
		animation_player.stop()
		await hit_sound.finished
		parent.queue_free()
	health_bar.max_value = MAX_HEALTH
	health_bar.value = health
	health_bar.visible = true
	

func _on_hitbox_area_entered(area):
	if iced == false:
		hitbox.set_deferred("monitoring", false)
		animation_player.play("Attack")
	
	await animation_player.animation_finished
	if iced == false:
		if is_instance_valid(area) && is_instance_valid(parent):
			if area.get_parent().name.contains("Minions") or area.get_parent().name.contains("Enemies"):
				area.get_parent().take_damage(DAMAGE)
			else:
				area.get_parent().get_child(0).take_damage(DAMAGE)
