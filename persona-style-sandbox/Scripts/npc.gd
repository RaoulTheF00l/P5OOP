extends StaticBody2D


enum NPCtype { NPC, ENEMY, FRIENDLY_SHADOW }

@export var npcName : String = "Jack Frost"
@export var npcType : NPCtype = NPCtype.ENEMY
@export var dialouge: array[String] = ["Hee-ho-he!"]

var dialougeIndex : int = 0

func interact() -> void:
	pass

func showDialouge() -> void:
	pass
