extends CharacterBody2D

const SPEED = 100

var nearby_npc: Node = null


func _physics_process(_delta: float) -> void:
	var dialogue_box = get_tree().current_scene.get_node_or_null("DialogueBox")
	
	if dialogue_box != null and dialogue_box.is_open:
		velocity = Vector2.ZERO
		move_and_slide()
		return
	
	var direction := Input.get_vector("Left", "Right", "Up", "Down")
	velocity = direction * SPEED
	move_and_slide()


func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("Interact"):
		if nearby_npc != null and nearby_npc.has_method("interact"):
			var dialogue_box = get_tree().current_scene.get_node_or_null("DialogueBox")
			
			if dialogue_box == null:
				print("DialogueBox not found in current scene.")
				return
			
			nearby_npc.interact(dialogue_box)


func _on_interact_zone_body_entered(body: Node2D) -> void:
	# The body that enters IS the NPC.
	nearby_npc = body


func _on_interact_zone_body_exited(_body: Node2D) -> void:
	nearby_npc = null
