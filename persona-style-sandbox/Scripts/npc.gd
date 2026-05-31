extends StaticBody2D

@export var npc_name: String = "NPC"
@export_multiline var dialogue_text: String = "..."

@export var starts_combat: bool = false
@export var gives_work: bool = false

@export var work_yen_reward: int = 1500
@export var work_kindness_reward: int = 1

var is_interacting: bool = false


func interact(dialogue_box: Node) -> void:
	if is_interacting:
		return
	
	is_interacting = true
	
	await dialogue_box.show_dialogue(npc_name, dialogue_text)
	
	if gives_work:
		do_work_reward()
	
	if starts_combat:
		get_tree().change_scene_to_file("res://Scenes/combat.tscn")
	
	
func do_work_reward() -> void:
	PlayerStats.yen += work_yen_reward
	PlayerStats.raise_stat("kindness", work_kindness_reward)
	TimeManager.advance_time()
	
	print("Worked at Leblanc.")
	print("Yen is now: " + str(PlayerStats.yen))
	print("Kindness is now: " + str(PlayerStats.kindness))
	print("Time is now: " + TimeManager.get_time_name())
