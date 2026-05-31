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
	
	if starts_combat:
		get_tree().change_scene_to_file("res://Scenes/combat.tscn")
	
	is_interacting = false
