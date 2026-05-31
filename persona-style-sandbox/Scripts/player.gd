extends CharacterBody2D

const SPEED = 100

var nearby_npc = null

func _ready():
	$InteractZone.body_entered.connect(_on_interact_zone_entered)
	$InteractZone.body_exited.connect(_on_interact_zone_exited)

func _physics_process(_delta):
	var direction = Input.get_vector("Left", "Right", "Up", "Down")
	velocity = direction * SPEED
	move_and_slide()

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("Interact") and nearby_npc != null:
		nearby_npc.interact()

func _on_interact_zone_entered(area: Node2D) -> void:
	nearby_npc = area.get_parent()

func _on_interact_zone_exited(area: Node2D) -> void:
	nearby_npc = null
