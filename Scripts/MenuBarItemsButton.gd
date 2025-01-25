extends Button


func _ready() -> void:
	self.connect("focus_entered", self, "_on_focus")
	#self.connect("mouse_entered", self, "_on_focus")


func _on_focus() -> void:
	self.grab_focus()
