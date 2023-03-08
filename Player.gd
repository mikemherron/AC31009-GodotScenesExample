extends KinematicBody2D

signal health_changed

class_name Player

onready var bullet_scene = preload("res://Bullet.tscn")

var speed : int = 30
export var maxHealth : int = 10
onready var health : int = maxHealth
var movement : Vector2

onready var animation : AnimatedSprite = $AnimatedSprite

func _process(delta):
	var last_movement : Vector2 = movement
	movement = Vector2.ZERO
	if Input.is_action_pressed("ui_up"):
		movement.y=-1
	if Input.is_action_pressed("ui_down"):
		movement.y=1
	if Input.is_action_pressed("ui_left"):
		movement.x=-1
	if Input.is_action_pressed("ui_right"):
		movement.x=1
	movement = movement.normalized()
	if movement != last_movement:
		_update_animation()
	move_and_slide(movement * speed)
	
	if Input.is_action_just_pressed("click"):
		var bullet : Bullet = bullet_scene.instance()
		owner.add_child(bullet)
		bullet.bullet_owner = self
		bullet.direction = position.direction_to(get_global_mouse_position())
		bullet.global_position = global_position

func _update_animation() -> void:
	if movement.y > 0:
		animation.play("down")
	elif movement.y < 0:
		animation.play("up")
	elif movement.x > 0:
		animation.play("right")
	elif movement.x < 0:
		animation.play("left")
	else:
		animation.play("idle")

func hit() -> void:
	health-=1
	emit_signal("health_changed", health)
	if health>0:
		$HitSound.play()

