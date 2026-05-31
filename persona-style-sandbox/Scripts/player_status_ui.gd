extends Control

@onready var yen_label: Label = $Panel/VBoxContainer/YenLabel
@onready var exp_label: Label = $Panel/VBoxContainer/EXPLabel

var last_yen: int = -1
var last_exp: int = -1


func _ready() -> void:
	refresh()


func _process(_delta: float) -> void:
	if PlayerStats.yen != last_yen or PlayerStats.exp != last_exp:
		refresh()


func refresh() -> void:
	last_yen = PlayerStats.yen
	last_exp = PlayerStats.exp
	
	yen_label.text = "Yen: " + str(PlayerStats.yen)
	exp_label.text = "Total EXP: " + str(PlayerStats.exp)
