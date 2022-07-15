extends Area2D


const BULLET_SCENE: PackedScene = preload("res://bullet.tscn")

@export var speed: int = 100


func _ready() -> void:
	pass # Replace with function body.


func _process(delta: float) -> void:
	if Input.is_action_pressed("ui_up"):
		position.y -= speed * delta
	if Input.is_action_pressed("ui_down"):
		position.y += speed * delta
	if Input.is_action_just_pressed("ui_accept"):
		_fire_bullet()


func _on_area_entered(area: Area2D) -> void:
	area.queue_free()
	queue_free()


func _fire_bullet() -> void:
	var bullet := BULLET_SCENE.instantiate() as RigidDynamicBody2D
	get_parent().add_child(bullet)
	bullet.global_position = global_position
