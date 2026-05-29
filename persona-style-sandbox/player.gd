extends CharacterBody2D


const SPEED = 100


func _ready():
	pass


func _physics_process(_delta):
	var direction = Input.get_vector("Left", "Right", "Up", "Down")
	velocity = direction * SPEED
	move_and_slide()
