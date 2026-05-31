extends Control

@onready var exp_label: Label = $Layout/expLabel
@onready var yen_label: Label = $Layout/yenLabel
@onready var accept_button: Button = $Layout/acceptButton

var reward_exp: int = 30
var reward_yen: int = 200


func _ready() -> void:
	# Wire the accept button (it has no connection in the .tscn).
	accept_button.pressed.connect(_on_accept_pressed)
	# Refresh once we're in the tree, in case setup() ran before our labels existed.
	update_ui()


func setup(exp: int, yen: int) -> void:
	reward_exp = exp
	reward_yen = yen
	if is_node_ready():
		update_ui()  # only safe once @onready labels are assigned


func update_ui() -> void:
	exp_label.text = "Exp: " + str(reward_exp)
	yen_label.text = "Yen: " + str(reward_yen)


func _on_accept_pressed() -> void:
	PlayerStats.yen += reward_yen
	PlayerStats.exp += reward_exp
	accept_button.disabled = true

	print("Ren gained " + str(reward_exp) + " Exp!")
	print("Ren gained " + str(reward_yen) + " Yen!")

	print("Total Stats: " + str(PlayerStats.exp) + " EXP and " + str(PlayerStats.yen))
	get_tree().change_scene_to_file("res://Scenes/leblanc.tscn")
