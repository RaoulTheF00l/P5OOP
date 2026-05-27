extends Node


#Add social stats below
@export var kindness: int = 0
@export var proficiency: int = 0
@export var knowledge: int = 0
@export var guts: int = 0
@export var charm: int = 0
@export var yen: int = 0

##Helper
func raise_stat(stat_name: String, amount: int) -> void:
	match stat_name:
		"kindness":
			kindness += amount
		"proficiency":
			proficiency += amount
		"guts":
			guts += amount
		"charm":
			charm += amount
		"knowledge":
			knowledge += amount
	print(stat_name + " is now: " + str(get(stat_name)))

#Add combat stats below

##Add autoload below


##Add local Save / Load functionality
	##Convert to JSON?
