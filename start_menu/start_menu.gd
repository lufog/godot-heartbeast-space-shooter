extends Node


@onready var _scene_tree := get_tree()


func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("ui_accept"):
		_scene_tree.change_scene("res://world.tscn")
	if Input.is_action_just_pressed("ui_cancel"):
		_scene_tree.quit()
