extends Button


func connect_signals(path: String, run_button: Button, WADFileInfo: ScrollContainer) -> void:
	self.connect("focus_entered", self, "_on_focus")
	#self.connect("mouse_entered", self, "_on_focus")
	
	self.connect("focus_entered", run_button, "set_info", [path])
	#self.connect("mouse_entered", run_button, "set_info", [path])

	self.connect("focus_entered", WADFileInfo, "load_file", [path])
	#self.connect("mouse_entered", WADFileInfo, "load_file", [path])


func _on_focus() -> void:
	self.grab_focus()
