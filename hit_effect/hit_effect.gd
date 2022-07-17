extends Node2D


@onready var _hit_particles: GPUParticles2D = $HitParticles


func _ready() -> void:
	_hit_particles.emitting = true


func _on_lifetime_timer_timeout() -> void:
	queue_free()
