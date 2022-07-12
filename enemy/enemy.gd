extends Area2D


@export var speed: int = 20
@export var armor: int = 3


func _process(delta: float) -> void:
	position.x -= speed * delta
