extends Node
class_name World


var score := 0:
	get:
		return score

	set(value):
		score = value
		score_label.text = str("Score: ", value)

@onready var score_label: Label = $ScoreLabel
@onready var _scene_tree := get_tree()


func _on_ship_player_died() -> void:
	await _scene_tree.create_timer(1).timeout
	_scene_tree.change_scene("res://game_over_screen/game_over_screen.tscn")
