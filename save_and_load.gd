extends Node


const SAVE_DATA_PATH := "user://save_data.json"


var default_save_data := {
	highscore = 0,
}

func save_data_to_file(save_data: Dictionary) -> void:
	var json := JSON.new()
	var json_string := json.stringify(save_data)
	var save_file := File.new()
	save_file.open(SAVE_DATA_PATH, File.WRITE)
	save_file.store_line(json_string)
	save_file.close()


func load_data_from_file() -> Dictionary:
	var save_file := File.new()
	if not save_file.file_exists(SAVE_DATA_PATH):
		return default_save_data
	
	save_file.open(SAVE_DATA_PATH, File.READ)
	var json := JSON.new()
	var status := json.parse(save_file.get_as_text())
	save_file.close()
	if status == OK:
		return json.get_data()
	
	return default_save_data
