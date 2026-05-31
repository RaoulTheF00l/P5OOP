extends Control

@onready var exp_label: Label = $Layout/expLabel
@onready var yen_label: Label = $Layout/yenLabel
@onready var accept_button: Button = $Layout/acceptButton

var reward_exp: int = 30
var reward_yen: int = 200




# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


func setup(exp: int, yen: int) -> void:
	reward_exp = exp
	reward_yen = yen
	update_ui()

func update_ui() -> void:
	exp_label.text = str(reward_exp)
	yen_label.text = str(reward_yen)

func _on_accept_pressed() -> void:
	PlayerStats.yen += reward_yen
	PlayerStats.exp += reward_exp
	
	print("Ren gained " + str(reward_exp) + " Exp!")
	print("Ren gained " + str(reward_yen) + " Yen!")
	
	print("Total Stats: " + str(PlayerStats.exp) + " EXP and " + str(PlayerStats.yen))
	get_tree().change_scene_to_file("res://Scenes/leblanc.tscn")
