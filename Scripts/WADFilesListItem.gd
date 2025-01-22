extends Button


#var info_panel = null
var run_button = null

func connect_signals(file_path: String) -> void:
	self.connect("focus_entered", self, "_on_focus")
	self.connect("mouse_entered", self, "_on_focus")
	self.connect("focus_entered", run_button, "set_info", [file_path])
	self.connect("mouse_entered", run_button, "set_info", [file_path])


func set_run_button(btn: Button) -> void:
	run_button = btn


#func set_info_panel(panel: ScrollContainer) -> void:
#	info_panel = panel


func _on_focus() -> void:
	self.grab_focus()
