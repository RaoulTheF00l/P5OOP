extends CharacterBody2D


const SPEED = 100

var nearby_npc = null

func _ready():
	pass


func _physics_process(_delta):
	var direction = Input.get_vector("Left", "Right", "Up", "Down")
	velocity = direction * SPEED
	move_and_slide()


@warning_ignore("unused_parameter")
func on_interact_zone_entered(area: Area2D) -> void:
	pass


@warning_ignore("unused_parameter")
func on_interact_zone_exit(area: Area2D) -> void:
	pass


@warning_ignore("unused_parameter")
func _unhandled_input(event: InputEvent) -> void:
	pass
