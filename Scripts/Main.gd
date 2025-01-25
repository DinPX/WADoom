extends Control


# ~/.config/gzdoom
var gzdoom_path := OS.get_system_dir(OS.SYSTEM_DIR_DOCUMENTS)+"/../.config/gzdoom"

onready var WADFilesListItemScript := preload("res://Scripts/WADFilesListItem.gd")

onready var MenuBarItems := $Items/MenuBar/Items
onready var WADFilesList := $Items/ContentArea/Items/WADFiles/List
onready var WADFileInfo := $Items/ContentArea/Items/WADFileInfo
onready var run_button := $Items/ContentArea/Items/WADFileInfo/Info/Buttons/Run


# TODO:
# Use Directory or File to access GZDoom files
# List the files to WADFiles/List
# Show the contents of the focused WADFilesList item
#	- Screenshot, title, author, DOOM/Hexen/etc., version, description and more info


func _ready() -> void:
	#_dummy() # For testing stuff
	_check_directory()


func _check_directory() -> void:
	var directory : Directory = Directory.new()

	if directory.open(gzdoom_path) == OK:
		directory.list_dir_begin()
		var file_name = directory.get_next()

		while file_name != "":
			if directory.current_is_dir():
				print("Found directory: " + file_name)

			else:
				print("Found file: " + file_name)

				if file_name.get_extension() != "ini":# and file_name.get_extension() != "pk3":
					var file_btn : Button = Button.new()
					var file_path : String = gzdoom_path + "/" + file_name

					WADFilesList.add_child(setup_file_btn(file_btn, file_name, file_path), true)

			file_name = directory.get_next()

	if WADFilesList.get_child_count() != 0:
		WADFilesList.get_child(0).grab_focus()

	else:
		print("An error occurred when trying to access the path.")


func setup_file_btn(btn: Button, btn_text: String, file_path: String) -> Button:
	btn.text = btn_text
	btn.align = Button.ALIGN_LEFT
	btn.flat = true
	btn.margin_right = 35.0
	btn.margin_bottom = 29.0
	btn.mouse_default_cursor_shape = Control.CURSOR_POINTING_HAND
	btn.shortcut_in_tooltip = false
	btn.light_mask = 0

	btn.name = btn_text
	btn.set_script(WADFilesListItemScript)
	btn.connect_signals(file_path, run_button, WADFileInfo)

	return btn


func _dummy() -> void:
	for dummy in 30:
		var dummy_item : Button = Button.new()

		dummy_item.text = "Item " + str(dummy+1)
		dummy_item.align = Button.ALIGN_LEFT
		dummy_item.flat = true
		dummy_item.margin_right = 35.0
		dummy_item.margin_bottom = 29.0
		dummy_item.mouse_default_cursor_shape = Control.CURSOR_POINTING_HAND
		dummy_item.shortcut_in_tooltip = false

		dummy_item.name = "Item " + str(dummy+1)
		dummy_item.set_script(WADFilesListItemScript)

		WADFilesList.add_child(dummy_item, true)

	if WADFilesList.get_child_count() != 0:
		WADFilesList.get_child(0).grab_focus()
