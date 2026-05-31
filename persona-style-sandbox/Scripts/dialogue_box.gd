extends Control

signal dialogue_finished

@onready var background: Panel = $Background
@onready var speaker_label: Label = $Background/SpeakerLabel
@onready var text_content_label: Label = $Background/TextContentLabel
@onready var speaker_icon: TextureRect = $Background/SpeakerIcon
@onready var confirm_button: Button = $Background/ConfirmButton

var is_open: bool = false


func _ready() -> void:
	background.visible = false
	confirm_button.pressed.connect(_on_confirm_button_pressed)
	
	await get_tree().process_frame
	await show_dialogue("Sojiro", "Get to work.")


func show_dialogue(speaker: String, text: String, portrait: Texture2D = null) -> void:
	is_open = true
	
	speaker_label.text = speaker
	text_content_label.text = text
	
	if portrait != null:
		speaker_icon.texture = portrait
	
	background.visible = true
	confirm_button.grab_focus()
	
	await dialogue_finished


func _on_confirm_button_pressed() -> void:
	is_open = false
	background.visible = false
	dialogue_finished.emit()
