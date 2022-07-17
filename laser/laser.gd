extends RigidDynamicBody2D


const HIT_EFFECT_SCENE: PackedScene = preload("res://hit_effect/hit_effect.tscn")


func _ready() -> void:
	pass # Replace with function body.


func destroy() -> void:
	_create_hit_effect()
	queue_free()


func _create_hit_effect() -> void:
	var hit_effect = HIT_EFFECT_SCENE.instantiate()
	get_parent().add_child(hit_effect)
	hit_effect.global_position = global_position
