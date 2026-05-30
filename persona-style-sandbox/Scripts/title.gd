extends Control


@onready var play_button: Button = $Layout/PlayButton
@onready var quit_buttom: Button = $Layout/QuitButtom


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	play_button.pressed.connect(_on_play_button_pressed)
	


func _on_play_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/leblanc.tscn")


func _on_quit_button_pressed() -> void:
	pass
