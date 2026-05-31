extends CharacterBody2D

const SPEED = 100

var nearby_npc = null

func _ready():
	pass

func _physics_process(_delta):
	var direction = Input.get_vector("Left", "Right", "Up", "Down")
	velocity = direction * SPEED
	move_and_slide()



func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventKey and not event.echo and event.pressed:
		if event.physical_keycode == KEY_Z:
			if nearby_npc != null:\
			if nearby_npc != null and nearby_npc.has_method("interact"):
					nearby_npc.interact()


func _on_interact_zone_body_entered(body: Node2D) -> void:
	nearby_npc = body.get_parent()





func _on_interact_zone_body_exited(_body: Node2D) -> void:
	nearby_npc = null
