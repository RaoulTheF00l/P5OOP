extends StaticBody2D


enum NPCType { NPC, ENEMY, FRIENDLY_SHADOW }

@export var npc_name : String = "Jack Frost"
@export var npc_type : NPCType = NPCType.ENEMY
@export var dialogue: Array[String] = ["Hee-ho-he!"]

var dialogue_index : int = 0

func interact() -> void:
	match npc_type:
		NPCType.FRIENDLY_SHADOW:
			show_dialouge()
		NPCType.NPC:
			show_dialouge()
		NPCType.ENEMY:
			print(npc_name + " Attacks!")
			show_dialouge()
			get_tree().change_scene_to_file("res://Scenes/combat.tscn")

func show_dialouge() -> void:
	if dialogue_index < dialogue.size():
		print(npc_name + ": " + dialogue[dialogue_index])
		dialogue_index += 1
	else:
		dialogue_index = 0
		print(npc_name + ": " + dialogue[dialogue_index])
	
