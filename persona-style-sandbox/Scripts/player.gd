extends CharacterBody2D

const SPEED = 100

var nearby_npc: Node = null


func _physics_process(_delta: float) -> void:
	var direction := Input.get_vector("Left", "Right", "Up", "Down")
	velocity = direction * SPEED
	move_and_slide()


func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("Interact"):
		if nearby_npc != null and nearby_npc.has_method("interact"):
			nearby_npc.interact()


func _on_interact_zone_body_entered(body: Node2D) -> void:
	# The body that enters IS the NPC (npc.gd lives on the StaticBody2D itself),
	# so we store it directly — no get_parent().
	nearby_npc = body


func _on_interact_zone_body_exited(_body: Node2D) -> void:
	nearby_npc = null
