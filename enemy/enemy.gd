extends Area2D


@export var speed: int = 20
@export var armor: int = 3


func _process(delta: float) -> void:
	position.x -= speed * delta


func _on_body_exited(body: Node2D) -> void:
	body.queue_free()
	
	armor -= 1
	if armor <= 0:
		queue_free()


func _on_visible_notifier_screen_exited() -> void:
	queue_free()
