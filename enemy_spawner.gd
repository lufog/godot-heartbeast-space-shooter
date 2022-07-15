extends Node2D


const ENEMY_SCENE: PackedScene = preload("res://enemy/enemy.tscn")


@onready var spawn_points: Node2D = $SpawnPoints


func _on_spawn_timer_timeout() -> void:
	_spawn_enemy()


func _get_spawn_point() -> Vector2:
	var index := randi_range(0, spawn_points.get_child_count() - 1)
	var points := spawn_points.get_children()
	return points[index].global_position


func _spawn_enemy() -> void:
	var enemy = ENEMY_SCENE.instantiate()
	get_parent().add_child(enemy)
	enemy.global_position = _get_spawn_point()
