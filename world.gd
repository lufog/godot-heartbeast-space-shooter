extends Node
class_name World


var score := 0:
	get:
		return score

	set(value):
		score = value
		score_label.text = str("Score: ", value)

@onready var score_label: Label = $ScoreLabel
