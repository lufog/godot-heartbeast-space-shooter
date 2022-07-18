extends Area2D


signal player_died

const EXPLOSION_EFFECT_SCENE: PackedScene = preload("res://explosion_effect/explosion_effect.tscn")
const LASER_SCENE: PackedScene = preload("res://laser/laser.tscn")

@export var speed: int = 100


func _process(delta: float) -> void:
	if Input.is_action_pressed("ui_up"):
		position.y -= speed * delta
	if Input.is_action_pressed("ui_down"):
		position.y += speed * delta
	if Input.is_action_just_pressed("ui_accept"):
		_fire_laser()


func _exit_tree() -> void:
	var explosion_effect := EXPLOSION_EFFECT_SCENE.instantiate() as Sprite2D
	get_parent().add_child(explosion_effect)
	explosion_effect.global_position = global_position
	player_died.emit()


func _on_area_entered(area: Area2D) -> void:
	area.queue_free()
	queue_free()


func _fire_laser() -> void:
	var laser := LASER_SCENE.instantiate() as RigidDynamicBody2D
	get_parent().add_child(laser)
	laser.global_position = global_position
