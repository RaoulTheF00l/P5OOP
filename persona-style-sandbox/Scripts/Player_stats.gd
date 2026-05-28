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
@export var hp: int = 100
@export var max_hp: int = 100
@export var sp: int = 70
@export var max_sp: int = 70
@export var atk: int = 15
@export var def: int = 10
@export var spd: int = 12
@export var mdef: int = 7
@export var matk: int = 6



##Add autoload below


##Add local Save / Load functionality
	##Convert to JSON?
