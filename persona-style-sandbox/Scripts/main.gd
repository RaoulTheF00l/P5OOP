extends Node

func _ready() -> void:
	$Layout/TalkButton.pressed.connect(_on_talk)
	$Layout/WorkButton.pressed.connect(_on_work)
	$Layout/StudyButton.pressed.connect(_on_study)
	$Layout/CraftButton.pressed.connect(_on_craft)
	$Layout/ShowerButton.pressed.connect(_on_shower)
	$Layout/HorrorButton.pressed.connect(_on_horror)

func _on_talk() -> void:
	PlayerStats.raise_stat("kindness", 2)

func _on_work() -> void:
	PlayerStats.raise_stat("proficiency", 2)
	PlayerStats.yen += 1500
	print("Yen is now: " + str(PlayerStats.yen))

func _on_study() -> void:
	PlayerStats.raise_stat("knowledge", 2)

func _on_craft() -> void:
	PlayerStats.raise_stat("proficiency", 2)

func _on_shower() -> void:
	PlayerStats.raise_stat("charm", 2)

func _on_horror() -> void:
	PlayerStats.raise_stat("guts", 2)
