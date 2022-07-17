extends Area2D


const EXPLOSION_EFFECT_SCENE: PackedScene = preload("res://explosion_effect/explosion_effect.tscn")

@export var speed: int = 20
@export var armor: int = 3

@onready var _world := get_parent() as World


func _process(delta: float) -> void:
	position.x -= speed * delta


func _on_body_entered(body: Node2D) -> void:
	body.destroy()
	
	armor -= 1
	if armor <= 0:
		_add_to_score()
		destroy()


func _on_visible_notifier_screen_exited() -> void:
	queue_free()


func destroy() -> void:
	_create_explosion()
	queue_free()


func _add_to_score() -> void:
	if _world != null:
		_world.score += 10


func _create_explosion() -> void:
	var explosion_effect := EXPLOSION_EFFECT_SCENE.instantiate() as Sprite2D
	get_parent().add_child(explosion_effect)
	explosion_effect.global_position = global_position
