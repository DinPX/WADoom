extends Button


var file_path := ""


func _ready() -> void:
	connect("pressed", self, "_run_wad")


func _run_wad() -> void:
	if file_path != "":
		OS.execute("gzdoom", ["-file" , file_path], false)


func set_info(path: String) -> void:
	file_path = path
