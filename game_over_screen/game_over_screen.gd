extends Node


@onready var highscore_label: Label = $HighscoreLabel


func _ready() -> void:
	_update_highscore()


func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("ui_cancel"):
		get_tree().change_scene("res://start_menu/start_menu.tscn")


func _update_highscore() -> void:
	var save_data := SaveAndLoad.load_data_from_file()
	highscore_label.text = str("Highscore : ", save_data.highscore)
