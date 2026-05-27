extends Node

enum TimeOfDay { MORNING, AFTERNOON, EVENING, NIGHT }

var current_day: int = 1
var current_time: TimeOfDay = TimeOfDay.MORNING

func advance_time() -> void:
	if current_time == TimeOfDay.NIGHT:
		current_day += 1
		current_time = TimeOfDay.MORNING
		print("=== Day " + str(current_day) + " ===")
	else:
		current_time = current_time + 1
	print("Time is now: " + get_time_name())

func get_time_name() -> String:
	match current_time:
		TimeOfDay.MORNING:
			return "Morning"
		TimeOfDay.AFTERNOON:
			return "Afternoon"
		TimeOfDay.EVENING:
			return "Evening"
		TimeOfDay.NIGHT:
			return "Night"
	return ""
