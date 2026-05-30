extends StaticBody2D


enum NPCType { NPC, ENEMY, FRIENDLY_SHADOW }

@export var npc_name : String = "Jack Frost"
@export var npc_type : NPCType = NPCType.ENEMY
@export var dialouge: Array[String] = ["Hee-ho-he!"]

var dialouge_index : int = 0

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
	if dialouge_index < dialouge.size():
		print(npc_name + ": " + dialouge[dialouge_index])
		dialouge_index += 1
	else:
		dialouge_index = 0
		print(npc_name + ": " + dialouge[dialouge_index])
	
